{ stdenv, buildPythonPackage, fetchPypi
, protobuf3_3, pytest }:

buildPythonPackage rec {
  name = "googleapis-common-protos-${version}";
  version = "1.5.3";

  src = fetchPypi {
    pname = "googleapis-common-protos";
    inherit version;
    sha256 = "1whfjl44gy15ha6palpwa2m0xi36dsvpaz8vw0cvb2k2lbdfsxf0";
  };

  propagatedBuildInputs = [ protobuf3_3 ];
  buildInputs = [ pytest ];

  doCheck = false;  # there are no tests

  meta = {
    description = "Common protobufs used in Google APIs";
    license = "apache";
  };
}
