{ lib, git, python3,  libsForQt5,
  #  python3Packages,
  # unrar,
  fetchPypi,
  # fetchFromGitHub,
  fetchgit,
  python3Packages
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
#    python3.pkgs.metron_talker #a12
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
    python3.pkgs.pycountry # Needed for #1.5.5 - deprecated later on
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
#    mokkari
    python3.pkgs.poetry-core
    python3.pkgs.ratelimit
    python3.pkgs.requests
  ]);

  mokkari = python3Packages.buildPythonPackage rec {
    pname = "mokkari";
    version = "3.1.0";
    format = "pyproject";

    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-DrVNidm9/i8a45CcRswA97aXX6tOe4BG4wdyTfNSm3E=";
    };
    propagatedBuildInputs = [
      python3.pkgs.poetry-core
      python3.pkgs.ratelimit
      python3.pkgs.requests
      python3.pkgs.pydantic
      python3.pkgs.mokkari
    # python3.pkgs.typing-extensions
    # python3.pkg.pytest
    # python3.pkgs.setuptools-scm
    # python3.pkgs.pydantic-core
    # python3.pkgs.pydantic-scim
    # python3.pkgs.invoke
    # python3.pkgs.isort
    # python3.pkgs.pytest
    # python3.pkgs.tox
    # python3.pkgs.setuptools_scm
    ];
    buildInputs = [
    # python3.pkgs.typing-extensions
    # python3.pkg.pytest
    # python3.pkgs.setuptools-scm
    # python3.pkgs.pydantic-core
    # python3.pkgs.pydantic
    # python3.pkgs.pydantic-scim
    # python3.pkgs.invoke
    # python3.pkgs.isort
    # python3.pkgs.pytest
    # python3.pkgs.tox
    # python3.pkgs.setuptools_scm
    # 
    ];
    nativeBuildInputs = [
#      python3.pkgs.typing-extensions
#      python3.pkg.pytest
#      python3.pkgs.setuptools-scm
#      python3.pkgs.pydantic-core
#      python3.pkgs.pydantic
#      python3.pkgs.pydantic-scim
#      python3.pkgs.invoke
#      python3.pkgs.isort
#      python3.pkgs.pytest
#      python3.pkgs.tox
#      python3.pkgs.setuptools_scm

    ];

  };
  
in
python3.pkgs.buildPythonApplication {
  pname = "comictagger";
  format = "pyproject";
# Stable Version 1.5.5
    version = "develop";
    dists = "x86_64-linux";
    src = fetchgit {
      url = "https://github.com/comictagger/comictagger.git";
      rev ="e5f6a7d1d636eccf68538283aac898f82fed082d";
#      hash = "sha256-AQcjdel5elOCDnBnARimTZXxY5k3hVWOXufoE9fqTlc=";
      hash ="sha256-qRI/+lEpz6+FuD64F/VrhnrHFH2NgMEJYbHmyrf3Ct0=";
    leaveDotGit = true;

  };

  preFixup = ''
   wrapQtApp "$out/bin/comictagger"
'';
  dontCheckRuntimeDeps = true;
  propagatedBuildInputs = [
    dependenciesPython
    libsForQt5.qtbase
  ];
  nativeBuildInputs = [
    git
    libsForQt5.wrapQtAppsHook
  ];
 postPatch = ''
#substituteInPlace comictalker/comictalker.py \
#--replace "1.6.0a7" "0.1.dev1"
#substituteInPlace setup.cfg \
'';
  meta = with lib; {
    description = "A multi-platform app for writing metadata to digital comics";
    homepage = "https://github.com/comictagger/comictagger";
    license = licenses.asl20;
    maintainers = [ maintainers.provenzano ];
    platforms = [ "x86_64-linux" ];
  };
 }

