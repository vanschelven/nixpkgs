{ stdenv, buildPythonPackage, fetchPypi
, google_api_core, google_gax, google_cloud_core, pytest, mock }:

buildPythonPackage rec {
  name    = "google-cloud-speech-${version}";
  version = "0.30.0";

  src = fetchPypi {
    pname = "google-cloud-speech";
    inherit version;
    sha256 = "0ckigh6bfzhflhllqdnfygm8w0r6ncp0myf1midifx7sn880g4pa";
  };

  propagatedBuildInputs = [ google_api_core google_gax google_cloud_core ];
  buildInputs = [ pytest mock ];

  checkPhase = ''
    py.test
  '';

  meta = {
    description = "Cloud Speech API enables integration of Google speech recognition into applications.";
    license = "apache";
  };
}
