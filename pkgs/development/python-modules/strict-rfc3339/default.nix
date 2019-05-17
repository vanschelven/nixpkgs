{ stdenv, buildPythonPackage, fetchPypi }:

buildPythonPackage rec {
  pname = "strict-rfc3339";
  version = "0.7";

  src = fetchPypi {
    inherit pname version;
    sha256 = "5cad17bedfc3af57b399db0fed32771f18fc54bbd917e85546088607ac5e1277";
  };

  meta = with stdenv.lib; {
    homepage = "http://www.danielrichman.co.uk/libraries/strict-rfc3339.html";
    license = "GNU General Public License Version 3";
    description = "Strict, simple, lightweight RFC3339 functions";
    maintainers = with maintainers; [ vanschelven ];
  };
}
