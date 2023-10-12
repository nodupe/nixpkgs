{ lib
, stdenv
, uefiStdenv
, llvmPackages
, makeRustPlatform
, rust
, newScope
, overrideCC
, pkgsBuildTarget
, wrapCCWith
, wrapBintoolsWith
, withRustFlags
, writeShellScriptBin
, cargo-auditable
}:

lib.makeScope newScope (self: with self; {
  # This is the system UEFI information.
  uefiPlatform = lib.systems.elaborate "${stdenv.hostPlatform.qemuArch}-windows" // {
    rustc.config = "${stdenv.hostPlatform.qemuArch}-unknown-uefi";
    linker = "lld";
    useLLVM = true;
  };

  stdenv = uefiStdenv;

  crossUefiStdenv =
  let
    stdenv' = stdenv.override (old: {
      targetPlatform = uefiPlatform;
    });
    llvmPackages' = llvmPackages.override {
      stdenv = stdenv';
      # This is necessary because otherwise
      # we will use the boot bintools (pkgs.bintools)
      # and we want a bintools aware of our stdenv.
      bootBintools = null;
      bootBintoolsNoLibc = null;
      # This is necessary because otherwise
      # -fPIC will be considered a flag to add.
      # It seems better to inform the CC wrapper about our actual
      # stdenv and let it take decisions on hardening.
      wrapCCWith = { ... }@args: (wrapCCWith args).override {
        stdenvNoCC = stdenv';
      };
      # This is necessary because otherwise
      # the binutils wrapper will contain
      # information about the `stdenv` dynamic linker
      # instead of the UEFI `stdenv` dynamic linker.
      wrapBintoolsWith = { ... }@args: (wrapBintoolsWith args).override {
        stdenvNoCC = stdenv';
      };
    };
    cc' = llvmPackages'.clangUseLLVM;
    uefi-linker = writeShellScriptBin "${cc'.targetPrefix}lld-link-wrapper" ''
      exec ${llvmPackages'.lld}/bin/lld-link "$@"
    '';
    bintools = cc'.bintools.override {
      extraBuildCommands = ''
        ln -s ${uefi-linker}/bin/${cc'.targetPrefix}lld-link-wrapper $out/bin/${cc'.targetPrefix}lld-link
      '';
    };
    cc = cc'.override {
      inherit bintools;
    };
  in
    (overrideCC stdenv' cc);

  # This is not using LLVM Clang CC for the target.
  crossRust =
  let
    crossRust' = (rust.override {
      stdenv = crossUefiStdenv;
    });
  in
    lib.recursiveUpdate crossRust' {
      packages.stable = crossRust'.packages.stable.overrideScope (self: super: {
        pkgsBuildTarget = pkgsBuildTarget // { targetPackages.stdenv = crossUefiStdenv; };
      });
    };

  # This is a cross UEFI rustPlatform.
  crossRustPlatform = makeRustPlatform {
    # This is necessary because we don't support lld-link in our ld-wrapper.
    stdenv = withRustFlags [ "-Clinker=${crossUefiStdenv.cc.bintools}/bin/${crossUefiStdenv.cc.targetPrefix}lld-link" ] uefiStdenv;
    inherit (crossRust.packages.stable) rustc cargo;
    # the lld-linker does not support Unix style flags for the linker
    # it does not detect neither it is dealing with a Windows style linker yet.
    # https://github.com/rust-secure-code/cargo-auditable/pull/116
    cargo-auditable = cargo-auditable.overrideAttrs (old: {
      meta.broken = true;
    });
  };

})
