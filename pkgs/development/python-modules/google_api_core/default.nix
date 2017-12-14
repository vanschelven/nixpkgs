{ stdenv, buildPythonPackage, fetchPypi
, google_auth, protobuf3_3, googleapis_common_protos, requests, grpcio, setuptools, mock, pytest }:

buildPythonPackage rec {
  name = "google-api-core-${version}";
  version = "0.1.2";

  src = fetchPypi {
    pname = "google-api-core";
    inherit version;
    sha256 = "0qmjswj079w7q7zbnh8p4n2r3f831wymm9hfdlc7zfrini7184xv";
  };

  propagatedBuildInputs = [ google_auth protobuf3_3 googleapis_common_protos requests grpcio ];
  buildInputs = [ setuptools mock pytest ];

  checkPhase = ''
    py.test
  '';

  meta = {
    description = "This library is not meant to stand-alone. Instead it defines common helpers used by all Google API clients.";
    license = "apache";
  };
}
