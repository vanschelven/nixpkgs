{ stdenv, buildPythonPackage, fetchPypi, six, nose }:

buildPythonPackage rec {
  pname = "anytree";
  version = "2.6.0";

  src = fetchPypi {
    inherit pname version;
    sha256 = "a221b6a603c3a5d5e417894dc48eaa8b1eab04056e1f5bb509bcfff0e7a47883";
  };

  doCheck = true;

  propagatedBuildInputs = [
    six
  ];

  nativeBuildInputs = [ 
    nose
  ];

  meta = with stdenv.lib; {
    homepage = "https://github.com/c0fec0de/anytree";
    license = licenses.asl20;
    description = "Powerful and Lightweight Python Tree Data Structure..";
    maintainers = with maintainers; [ vanschelven ];
  };
}

