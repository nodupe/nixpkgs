{ lib
, buildPythonPackage
, fetchFromGitHub
, typing-extensions
, python3Packages
, setuptools-scm
, python3

}:

buildPythonPackage rec {
  pname = "mokkari";
  version = "2.6.1";
  format = "pyproject";

  src = fetchFromGitHub {
    inherit pname version;
    repo = "mokkari";
    rev = "ae594390723ff7e5dd9ab9f0e713599e9e346008";
    owner="Metron-Project";
    sha256 = "sha256-V3oEcTZ3ivAMK/v1j78bmFx1DGNZO6fXMfMdjorQZIQ=";
  };

  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
    python3.pkgs.marshmallow
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
