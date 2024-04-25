{ lib
, buildPythonPackage
, fetchPypi
, pkgs
, python3
  
}:

buildPythonPackage rec {
  pname = "comicfn2dict";
  version = "0.2.2";
  format = "pyproject";
# setuptools";
#  pyproject = true;
  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-eKSF0QAwEO75kFcVFl9KuedshFmYHU5NVBw/DuF7O1A=";
  };
  nativeBuildInputs = [
    pkgs.poetry
  ];
  propagatedBuildInputs = [
    python3.pkgs.poetry-core
    
                          ];

  pythonImportsCheck = [ "comicfn2dict" ];

  meta = with lib; {
    description = "An API and CLI for extracting structured comic metadata from filenames.";
    homepage = "https://github.com/ajslater/comicfn2dict";
    license = licenses.gpl3;
    maintainers = with maintainers; [ provenzano ];
  };
}
