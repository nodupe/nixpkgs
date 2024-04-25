{ lib
, buildPythonPackage
, fetchPypi
, python3
}:

buildPythonPackage rec {
  pname = "isocodes";
  version = "2024.2.2";
  format = "pyproject";

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-ULdH7bX04ee7dA6XLsUGK5gZ/B/UF8M+5jNENqM2f2o=";

  };

  propagatedBuildInputs = [ python3.pkgs.hatchling];

  pythonImportsCheck = [ "isocodes" ];

  meta = with lib; {
    description = "isocodes provides you access to lists of various ISO standards (e.g. country, language, language scripts, and currency names).";
    homepage = "https://github.com/Atem18/isocodes";
    license = licenses.lgpl21Only;
    maintainers = with maintainers; [ provenzano ];
  };
}
