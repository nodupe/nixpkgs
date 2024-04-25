{ lib, git, python3,  libsForQt5,
  #  python3Packages,
  # unrar,
  # fetchPypi,
  # fetchFromGitHub,
 fetchgit
}:
let
  dependenciesPython = python3.withPackages (pkgs: [

    # install_requires
    python3.pkgs.appdirs #a12
    python3.pkgs.beautifulsoup4 #a12
    python3.pkgs.chardet #a12
    python3.pkgs.comicfn2dict #a12
    python3.pkgs.importlib-metadata #a12
    python3.pkgs.isocodes #a12
    python3.pkgs.natsort #a12
    python3.pkgs.packaging #a12
    python3.pkgs.pathvalidate #a12
    python3.pkgs.pillow #a12
    python3.pkgs.pyrate-limiter #a12
    python3.pkgs.pyyaml #a12
    python3.pkgs.rapidfuzz #a12
    python3.pkgs.requests #a12 
    python3.pkgs.settngs #a12
    python3.pkgs.text2digits #a12
    python3.pkgs.typing-extensions #a12
    python3.pkgs.wordninja #a12

    # options.extras_require
    # 7Z
    python3.pkgs.py7zr #a12    
    # CBR
    python3.pkgs.rarfile #a12
    # GUI
    python3.pkgs.pyqt5 #a12
    # ICU
    python3.pkgs.pyicu #a12
    # all
    python3.pkgs.pyqt5 #a12
    python3.pkgs.pyqtwebengine #a12
    python3.pkgs.comicinfoxml
    python3.pkgs.gcd-talker #a12
    python3.pkgs.metron_talker #a12
    python3.pkgs.pillow-avif-plugin #a12
    python3.pkgs.py7zr #a12    
    python3.pkgs.rarfile #a12
    python3.pkgs.pyicu #a12
    # avif
    python3.pkgs.pillow-avif-plugin #a12
    #cix
    python3.pkgs.comicinfoxml
    #gcd
    python3.pkgs.gcd-talker #a12
    #metron
    python3.pkgs.metron_talker #a12
    #test-env
    python3.pkgs.pytest #a12
    #test-env format
    python3.pkgs.black #a12
    python3.pkgs.isort #a12
    python3.pkgs.autoflake #a12
    python3.pkgs.pyupgrade #a12
    # test-env lint
    python3.pkgs.flake8 #a12
    python3.pkgs.mypy #a12
    python3.pkgs.types-setuptools #a12
    python3.pkgs.types-requests #a12

    # Running Deps 
    python3.pkgs.mokkari #a12
    #python3.pkgs.configparser 
    #python3.pkgs.hatchling
    #python3.pkgs.pycountry
    #python3.pkgs.pydantic
    #python3.pkgs.pydantic-core
    #python3.pkgs.pydantic-scim
    #python3.pkgs.pyinstaller
    #python3.pkgs.pypdf2
    #python3.pkgs.setuptools
    #python3.pkgs.pywayland
    #python3.pkgs.unrar-cffi
    #python3.pkgs.xcffib
    #python3.pkgs.zipfile2
    #python3.pkgs.pytest-flake8
    #python3.pkgs.pydantic-extra-types
    #python3.pkgs.pydantic-settings
  ]);
in python3.pkgs.buildPythonApplication {
  pname = "comictagger";
  format = "pyproject";
  #### Different develop versions
    version = "develop";
    dists = "x86_64-linux";
    src = fetchgit {
      url = "https://github.com/comictagger/comictagger.git";
      rev = "996397b9d51872ea2a3bae9ef890495775a196f8";
      hash = "sha256-AcQ6ZI4ksKE5j4IZHWYg8HiIsVStO7UIYB6C2DYioKs=";

#      version = "1.6.0-alpha.12";
#      dists = "x86_64-linux";
#      src = fetchgit {
#        url = "https://github.com/comictagger/comictagger.git";
#        rev = "2e2d886cb2443f067ba99ae0fb138afe58e8a6d7";
#        hash = "sha256-o44CMHEhjH3G+D0OkVOP36qUq84CsNtjmQoGU0tPoMU=";
#
#
        
#  ####  
#   version = "1.6.0-alpha.10";
#   dists = "x86_64-linux";
#   src = fetchgit {
#     url = "https://github.com/comictagger/comictagger.git";
#    rev = "39407286b3d873f6217394ccd4a05dc3efa5c9db";
#    hash = "sha256-Hfxa1LarM/mVGdNDbxddSbXRY8enXY0qiU5GMHRL0r8";
  ####
  #      
#  version = "1.6.0-alpha.9";
#  dists = "x86_64-linux";
#  src = fetchgit {
#    url = "https://github.com/comictagger/comictagger.git";
#    rev = "1.6.0-alpha.9";
#    hash = "sha256-9qaUCy4K/oSAdH/Er3DEzxghDNHQYiXr2nRWY8JE6Jo=";
#  ###
#  version = "1.6.0-alpha.8";
#  dists = "x86_64-linux";
#  src = fetchgit {
#    url = "https://github.com/comictagger/comictagger.git";
#    rev = "1.6.0-alpha.8";
#    hash = "sha256-uXj30R6ltj4DS3UkaFwuf3O7vaN/yO0Lk6xzKMCgKFU=";
    ###
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
