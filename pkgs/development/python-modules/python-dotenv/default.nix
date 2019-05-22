{ stdenv, buildPythonPackage, fetchPypi, pytest, click, sh, ipython }:

buildPythonPackage rec {
  pname = "python-dotenv";
  version = "0.10.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1nmzcwhn483ibq21vngrf44p1rlxs74idv2girj89avcdvbsqh36";
  };

  doCheck = true;

  nativeBuildInputs = [
    pytest
    sh
    click
    ipython
  ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/theskumar/python-dotenv";
    license = licenses.bsd3;
    description = "Get and set values in your .env file in local and production servers.";
    maintainers = with maintainers; [ vanschelven ];
  };
}
