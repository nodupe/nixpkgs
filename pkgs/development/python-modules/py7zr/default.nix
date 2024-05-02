{ lib
, buildPythonPackage
, fetchPypi
, fetchFromGitHub
, brotli
, brotlicffi
, importlib-metadata
, psutil
, pycryptodomex
, texttable
, poetry-core
, setuptools
, setuptools-scm
, python3
, python3Packages
, typing-extensions
, zstd
}:
let
  pyzstd = python3Packages.buildPythonPackage rec {
    pname = "pyzstd";
    version = "dbd449837b177bfe81392911cf4f043f8a674dab";
    src = fetchFromGitHub {
#      inherit version;
      owner = "Rogdham";
      repo = "pyzstd";
      sha256 = "sha256-kLMYT/7WfCvat5UdE4VJe4xBX2F4CThlj1XTxo0OhQA=";
      fetchSubmodules = true;
      leaveDotGit = true;
      rev = "dbd449837b177bfe81392911cf4f043f8a674dab";
    };
    propagatedBuildInputs = [
      setuptools
      python3Packages.pypaBuildHook
      python3Packages.grpcio

    ];
    #  pythonImportsCheck = [ "settngs" ];
    meta = with lib; {
      description = "Pyzstd module provides classes and functions for compressing and decompressing data, using Facebook's Zstandard (or zstd as short name) algorithm.";
      homepage = "https://github.com/Rodgham/pyzstd";
      license = licenses.bsd3;
      maintainers = with maintainers; [ provenzano ];
    }; 
  };

  pyppmd = python3Packages.buildPythonPackage rec {
    pname = "pyppmd";
    version = "1.0.0";
    src = fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "sha256-B1yb0pfjsKh9166ryn/uZoIYrL5p7MHGURBkVY3ohA8=";
    };
    propagatedBuildInputs = [
      setuptools-scm
    ];
  };
  
   pybcj = python3Packages.buildPythonPackage rec {
    pname = "pybcj";
    version = "1.0.2";
    src = fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "sha256-x/W+9/R3I8U0ION3vGTSVThDvui8rF8K0HarFSR4ABg=";
    };
    propagatedBuildInputs = [
      setuptools-scm
    ];
  };
multivolumefile = python3Packages.buildPythonPackage rec {
    pname = "multivolumefile";
    version = "0.2.3";
    src = fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "sha256-oGSNCq+8luWRmNXBfprK1+tTGr6lEDXQjOgGDcrXCdY=";
    };
    propagatedBuildInputs = [
      setuptools-scm
    ];
  };
  inflate64 = python3Packages.buildPythonPackage rec {
    pname = "inflate64";
    version = "1.0.0";
    src = fetchPypi {
      inherit version;
      inherit pname;
      sha256 = "sha256-MniCe4A88Aah3yUfPhM3TH0m23eeWjMynMEXibgEvC0=";
    };
    propagatedBuildInputs = [
      setuptools-scm
    ];
  };

#   pillow = python3Packages.buildPythonPackage rec {
#    pname = "pillow";
#    version = "10.0.1";
#    src = fetchPypi rec {
#      inherit version;
#      inherit pname;
#      sha256 = "sha256-B1yb0pfjsKh9166ryn/uZoIYrL5p7MHGURBkVY3ohA8=";
#      dist = python;
#      python = "py3";
#    };
#    propagatedBuildInputs = [
#      setuptools-scm
#    ];
#  };
#
  
  comicinfoxml = python3Packages.buildPythonPackage rec {
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
  };
  
  py7zr = buildPythonPackage rec {
    pname = "py7zr";
    version = "0.20.6";
    format = "pyproject";
    src = fetchPypi {
      inherit pname version;
      sha256 = "sha256-0Dbe4R/Oaa2NT6hgJcz8SjUR7CfuHGtb2NZ1kxPb0Hc=";
    };
    propagatedBuildInputs = [
      inflate64
      comicinfoxml
      brotli
      brotlicffi
      importlib-metadata
      pybcj
      multivolumefile
      psutil
      pycryptodomex
      texttable
      poetry-core
      setuptools
      setuptools-scm
      pyzstd
      pyppmd
     ];
    meta = with lib; {
      description = "Pure python 7-zip library";
      homepage = "https://github.com/miurahr/py7zr";
      license = licenses.lgpl2;
      maintainers = with maintainers; [ provenzano ];
    };
  };
in py7zr


