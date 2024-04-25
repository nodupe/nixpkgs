{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm

}:

buildPythonPackage rec {
  pname = "settngs";
  version = "0.10.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-j+1IZ7QnpJKJqJGDN78jovz7h5f8EzPGp3Q0ZQnkH5Y=";
  };

  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
  ];

#  pythonImportsCheck = [ "settngs" ];

  meta = with lib; {
    description = "A library for managing settings";
    homepage = "https://github.com/lordwelch/settngs";
    license = licenses.mit;
    maintainers = with maintainers; [ provenzano ];
  };
}
