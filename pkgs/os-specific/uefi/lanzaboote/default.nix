{ rustPlatform, lib, fetchFromGitHub }:

rustPlatform.buildRustPackage {
  pname = "lanzaboote-stub";
  version = "0.3.0";

  src = fetchFromGitHub {
    owner = "nix-community";
    repo = "lanzaboote";
    rev = "v0.3.0";
    hash = "sha256-Fb5TeRTdvUlo/5Yi2d+FC8a6KoRLk2h1VE0/peMhWPs=";
  };

  sourceRoot = "source/rust/stub";

  # Necessary because our `cc-wrapper` doesn't understand MSVC link options.
  # RUSTFLAGS = "-Clinker=${stdenv.cc.bintools}/bin/${stdenv.cc.targetPrefix}lld-link";
  # RUSTFLAGS = if uefiLinker != null then "-Clinker=${uefiLinker}/bin/lld-link" else "";
  # Necessary because otherwise we will get (useless) hardening options in front of
  # -flavor link which will break the whole command-line processing for the ld.lld linker.
  hardeningDisable = [ "all" ];

  # TODO: limit supported platforms to UEFI
  meta.platforms = lib.platforms.all;
}
