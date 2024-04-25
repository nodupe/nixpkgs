{ lib
, buildPythonPackage
, fetchPypi
, typing-extensions
, python3Packages
, setuptools-scm
, pkgs
}:

buildPythonPackage rec {
  pname = "pillow-avif-plugin";
  version = "1.4.3";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-o3e+lNWzgQ4H4CIYBkkOjhoojzjnIiVn2BCl2haxu80=";
  };

  propagatedBuildInputs = [
    typing-extensions
    python3Packages.pytest
    setuptools-scm
    pkgs.libavif
  ];

#  pythonImportsCheck = [ "settngs" ];

  meta = with lib; {
    description = "This is a plugin that adds support for AVIF files until official support has been added";
    homepage = "https://github.com/fdintino/pillow-avif-plugin";
    license = licenses.bsd2;
    maintainers = with maintainers; [ provenzano ];
  };
}
