{ stdenv, buildPythonPackage, fetchPypi, lib
, six, protobuf3_3, enum34, futures, isPy26, isPy27, isPy34 }:

buildPythonPackage rec {
  name = "grpcio-${version}";
  version = "1.7.3";

  src = fetchPypi {
    pname = "grpcio";
    inherit version;
    sha256 = "1wkrxj1jmf2dyx207fc9ysyns9h27gls3drgg05mzdckjqr5lnl6";
  };

  propagatedBuildInputs = [ six protobuf3_3 ]
                        ++ lib.optionals (isPy26 || isPy27 || isPy34) [ enum34 ]
                        ++ lib.optionals (isPy26 || isPy27) [ futures ];

  meta = {
    description = "HTTP/2-based RPC framework";
    license     = lib.licenses.bsd3;
  };
}
