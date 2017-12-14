{ stdenv, buildPythonPackage, fetchPypi
, pytest, mock, oauth2client, flask, requests, urllib3, pytest-localserver, six, pyasn1-modules, cachetools, rsa }:

buildPythonPackage rec {
  name    = "google-auth-${version}";
  version = "1.2.1";

  src = fetchPypi {
    pname = "google-auth";
    inherit version;
    sha256 = "041qpwlvpawggasvbfpkx39mkg4dgvivj831x7kinidayrf46w3i";
  };

  buildInputs = [ pytest mock oauth2client flask requests urllib3 pytest-localserver ];
  propagatedBuildInputs = [ six pyasn1-modules cachetools rsa ];

  # The removed test tests the working together of google_auth and google's https://pypi.python.org/pypi/oauth2client
  # but the latter is deprecated. Since it is not currently part of the nixpkgs collection and deprecated it will
  # probably never be. We just remove the test to make the tests work again.
  postPatch = ''rm tests/test__oauth2client.py'';

  checkPhase = ''
    py.test
  '';

  meta = {
    description = "This library simplifies using Google’s various server-to-server authentication mechanisms to access Google APIs.";
    license = "apache";
  };
}
