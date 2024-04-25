{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm

}:

buildPythonPackage rec {
  pname = "comicinfoxml";
  version = "0.2.0";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-vrDlkKIm0tfr/o4287FcImCVxkGcvAiNdoe8EE78Cjk=";

  };

  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
  ];

#  pythonImportsCheck = [ "settngs" ];

  meta = with lib; {
    description = "ComicInfo.xml plugin for Comic Tagger";
    homepage = "https://github.com/comictagger/comicinfoxml";
    license = licenses.mit;
    maintainers = with maintainers; [ provenzano ];
  };
}
