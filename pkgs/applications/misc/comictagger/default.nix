{ lib, git, python3,  libsForQt5,
  #  python3Packages,
  # unrar,
  # fetchPypi,
  # fetchFromGitHub,
 fetchgit
}:
let
  dependenciesPython = python3.withPackages (pkgs: [
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
    python3.pkgs.comicfn2dict
    python3.pkgs.chardet
    python3.pkgs.pyyaml
  ]);
in python3.pkgs.buildPythonApplication {
  pname = "comictagger";
  format = "pyproject";
#### Different develop versions
  version = "1.6.0-alpha.12";
  dists = "x86_64-linux";
  src = fetchgit {
    url = "https://github.com/comictagger/comictagger.git";
    rev = "2e2d886cb2443f067ba99ae0fb138afe58e8a6d7";
    hash = "sha256-o44CMHEhjH3G+D0OkVOP36qUq84CsNtjmQoGU0tPoMU=";
    ####  
    #  version = "1.6.0-alpha.10";
    #  dists = "x86_64-linux";
    #  src = fetchgit {
    #    url = "https://github.com/comictagger/comictagger.git";
    #    rev = "230a4b6558547f215d6be26d3880db1a27d181f9";
    #    hash = "sha256-9qaUCy4K/oSAdH/Er3DEzxghDNHQYiXr2nRWY8JE6Jo=";
    ####
    #  version = "1.6.0-alpha.8";
    #  dists = "x86_64-linux";
    #src = fetchgit {
    # url = "https://github.com/comictagger/comictagger.git";
    #  rev = "96c5c4aa28cf38afa51ecc3eb2f0a9c65d91b686";
    #  hash = "sha256-uXj30R6ltj4DS3UkaFwuf3O7vaN/yO0Lk6xzKMCgKFU=";
    ####
    #    version = "1.6.0-alpha.6";
    #  dists = "x86_64-linux";
    #  src = fetchgit {
    #    url = "https://github.com/comictagger/comictagger.git";
    #    rev = "e7cc05679fb3dd1550df2dd160a2439bcbea1007";
    #    hash = "sha256-WxcCm5f5zll+dxJtG5/f0j0PXhuzSzhX16Q9VoIv+NY=";
    ####
    #  version = "1.6.0-alpha.5";
    #  dists = "x86_64-linux";
    #  src = fetchgit {
    #    url = "https://github.com/comictagger/comictagger.git";
    #    rev = "3ade47a7e095b1ebb1630a633b62a99706a7f310";
    #    hash = "sha256-FdB5tqaBGfkRyqDBi/bPyfW67V1yTBl6L43InYY68NE=";
    ######
    #      version = "1.6.0-alpha.12";
    #  dists = "x86_64-linux";
    #  src = fetchgit {
    #    url = "https://github.com/comictagger/comictagger.git";
    #    rev = "996397b9d51872ea2a3bae9ef890495775a196f8";
    #    hash = "sha256-d1UDFd1XNW2u29IVV8AulWGvScS0+adg8uIcitLWoeY=";
    leaveDotGit = true;

  };

# Stable 1.5.5
#  src = fetchPypi {
# pname = "comictagger";
#    version = "1.5.5";
#    hash = "sha256-f/SS6mo5zIcNBN/FRMhRPMNOeB1BIqBhsAogjsmdjB0=";
#  };

  preFixup = ''
   wrapQtApp "$out/bin/comictagger"
'';
  
  propagatedBuildInputs = [
    dependenciesPython
    libsForQt5.qtbase
  ];
  nativeBuildInputs = [
    git
    dependenciesPython
    libsForQt5.wrapQtAppsHook
  ];
 postPatch = ''
substituteInPlace comictalker/comictalker.py \
--replace "1.6.0a7" "0.1.dev1"
'';

    
  meta = with lib; {
    description = "A multi-platform app for writing metadata to digital comics";
    homepage = "https://github.com/comictagger/comictagger";
    license = licenses.asl20;
    maintainers = [ maintainers.provenzano ];
    platforms = [ "x86_64-linux" ];
  };
}
