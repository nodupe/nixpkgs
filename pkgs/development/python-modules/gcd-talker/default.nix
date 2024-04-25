{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm

}:

buildPythonPackage rec {
  pname = "gcd_talker";
  version = "0.1.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-AuL89iCrIHJ7AJRoh1OWwjaur6HXXb7kEMsfHUQUGhE=";
  };

  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
  ];

#  pythonImportsCheck = [ "settngs" ];

  meta = with lib; {
    description = "Grand Comics Database™ plugin for Comic Tagger";
    homepage = "https://github.com/comictagger/gcd_talker";
    license = licenses.asl20;
    maintainers = with maintainers; [ provenzano ];
  };
}
