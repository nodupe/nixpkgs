{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm
, python3
,pkgs
}:
let pyEnv = python3.withPackages( ps: [
      ps.pydantic
      ps.pydantic-scim
      ps.pydantic-core
    ]
    );
in
buildPythonPackage rec {
  pname = "metron_talker";
  version = "0.1.5";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-/1UmhK0gFSwpb6fI0kKJXdMMPx8GeKGZ/LWhbiYzJMw=";
  };
  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
    python3.pkgs.pydantic-core
    python3.pkgs.pydantic
    python3.pkgs.pydantic-scim
    python3.pkgs.invoke
    python3.pkgs.isort
    python3.pkgs.pytest
    python3.pkgs.tox
    python3.pkgs.mokkari
    python3.pkgs.setuptools_scm
    pkgs.pyenv
  ];
  buildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
    python3.pkgs.pydantic-core
    python3.pkgs.pydantic
    python3.pkgs.pydantic-scim
    python3.pkgs.invoke
    python3.pkgs.isort
    python3.pkgs.pytest
    python3.pkgs.tox
    python3.pkgs.setuptools_scm

  ];
  nativeBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
    python3.pkgs.pydantic-core
    python3.pkgs.pydantic
    python3.pkgs.pydantic-scim
    python3.pkgs.invoke
    python3.pkgs.isort
    python3.pkgs.pytest
    python3.pkgs.tox
    python3.pkgs.setuptools_scm
    pkgs.pyenv
  ];

  #  pythonImportsCheck = [ "settngs" ];

  meta = with lib; {
    description = "Metron.cloud plugin for Comictagger";
    homepage = "https://github.com/lordwelch/metron_talker";
    license = licenses.mit;
    maintainers = with maintainers; [ provenzano ];
  };
}
