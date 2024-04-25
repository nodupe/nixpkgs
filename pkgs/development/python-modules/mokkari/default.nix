{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm
, python3

}:

buildPythonPackage rec {
  pname = "mokkari";
  version = "3.1.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-DrVNidm9/i8a45CcRswA97aXX6tOe4BG4wdyTfNSm3E=";
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
    python3.pkgs.setuptools_scm
    python3.pkgs.poetry-core
    python3.pkgs.requests
    python3.pkgs.ratelimit
    python3.pkgs.vulture
    python3.pkgs.radon
    python3.pkgs.fastapi
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
    
  ];



  meta = with lib; {
    description = "A python wrapper for the metron.cloud API";
    homepage = "https://github.com/Metron-Project/mokkari";
    license = licenses.gpl3;
    maintainers = with maintainers; [ provenzano ];
  };
}
