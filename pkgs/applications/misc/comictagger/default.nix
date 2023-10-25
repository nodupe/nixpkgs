{
  fetchgit
, git
, lib
, p7zip
, pkgs
, python3
, python3Packages
, rar
, unrar
, unrar-wrapper
, libsForQt5
, xorg
}:

let
  myPython = python3.withPackages (pkgs: [
    python3.pkgs.appdirs
    python3.pkgs.beautifulsoup4
    python3.pkgs.configparser
    python3.pkgs.importlib-metadata
    python3.pkgs.natsort
    python3.pkgs.pathvalidate
    python3.pkgs.pillow
    python3.pkgs.py7zr
    python3.pkgs.pycountry
    python3.pkgs.pyicu
    python3.pkgs.pyinstaller
    python3.pkgs.pypdf2
    python3.pkgs.pyqt5
    python3.pkgs.pyrate-limiter
    python3.pkgs.rapidfuzz
    python3.pkgs.rarfile
    python3.pkgs.requests
    python3.pkgs.settngs
    python3.pkgs.setuptools
    python3.pkgs.text2digits
    python3.pkgs.typing-extensions
    python3.pkgs.unrar-cffi
    python3.pkgs.wordninja
    python3.pkgs.xcffib
    python3.pkgs.zipfile2
    python3.pkgs.pyqt5
    python3.pkgs.pywayland
  ]);

  in

python3.pkgs.buildPythonApplication rec {
  pname = "comictagger";
  #  version = "1.6-alpha.8";
  format = "pyproject";
  version = "1.5.5";
  dists = "x86_64-linux";

  src = fetchgit {
    url = "https://github.com/comictagger/comictagger.git";
    leaveDotGit = "true";
    rev = "96c5c4aa28cf38afa51ecc3eb2f0a9c65d91b686";
    sha256 = "sha256-ZevKw9Izpx+f9PyxvpVSw0BwMHuoEzw6mxaDDWR9C0U=";
  };
  runtimeDeps = [
  #  unrar
  #    p7zip
  #   unrar-wrapper
  ];

  preFixup = ''
wrapQtApp "$out/bin/comictagger"
''; 
  propagatedBuildInputs = [
    myPython
    xorg.libxcb
    libsForQt5.qtbase
    unrar
  ];
  nativeBuildInputs = [ git myPython libsForQt5.wrapQtAppsHook ];
  
  meta = with lib; {
    description = "A multi-platform app for writing metadata to digital comics";
    homepage = "https://github.com/comictagger/comictagger";
    license = licenses.asl20;
    maintainers = [ maintainers.provenzano ];
    platforms = [ "x86_64-linux" ];
  };
}
