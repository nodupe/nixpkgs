{ lib,
  git,
  python3,
  libsForQt5,
  fetchgit,
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
    python3.pkgs.pillow-avif-plugin #a12
    python3.pkgs.comicinfoxml
    python3.pkgs.gcd-talker #a12
    python3.pkgs.metron_talker #a12
    python3.pkgs.pytest #a12
    python3.pkgs.black #a12
    python3.pkgs.isort #a12
    python3.pkgs.autoflake #a12
    python3.pkgs.pyupgrade #a12
    python3.pkgs.flake8 #a12
    python3.pkgs.mypy #a12
    python3.pkgs.types-setuptools #a12
    python3.pkgs.types-requests #a12
    # Running Deps 
    python3.pkgs.poetry-core
    python3.pkgs.ratelimit
    python3.pkgs.requests
  ]);
  
in
python3.pkgs.buildPythonApplication {
  pname = "comictagger";
  format = "pyproject";
  #### Different develop versions
    version = "develop";
    dists = "x86_64-linux";
    src = fetchgit {
      url = "https://github.com/comictagger/comictagger.git";
       rev = "851339d4e39e869f81d6868f2f9f59ac96304be3";
        #"6ac2e326121bf582e38c61cf1b9179059989d897";
       hash = "sha256-Xg6tQGRYhN1rz6A+2yaZBQVEL9pkFlWMWdrOIKu2omc=";
         #"sha256-r2ofRx4D4A8lsBxvz59bXloQaLHvpQW4F/Lj0iC92mY=";
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
substituteInPlace comictalker/__init__.py \
--replace-fail "if ct_version >= parse(obj.comictagger_min_ver):" "if ct_version != parse(obj.comictagger_min_ver):"
'';
  meta = with lib; {
    description = "A multi-platform app for writing metadata to digital comics";
    homepage = "https://github.com/comictagger/comictagger";
    license = licenses.asl20;
    maintainers = [ maintainers.provenzano ];
    platforms = [ "x86_64-linux" ];
  };
 }

