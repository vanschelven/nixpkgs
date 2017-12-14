{ stdenv, buildPythonPackage, fetchPypi
, google_api_core, grpcio, pytest, mock }:

buildPythonPackage rec {
  name    = "google-cloud-core-${version}";
  version = "0.28.0";

  src = fetchPypi {
    pname = "google-cloud-core";
    inherit version;
    sha256 = "1h8bx99ksla48zkb7bhkqy66b8prg49dp15alh851vzi9ii2zii7";
  };

  propagatedBuildInputs = [ google_api_core grpcio ];
  buildInputs = [ pytest mock ];

  checkPhase = ''
    py.test
  '';

  meta = {
    description = "API Client library for Google Cloud: Core Helpers";
    license = "apache";
  };
}
