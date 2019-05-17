{ lib, buildPythonPackage, fetchPypi, libyaml, buildPackages }:

buildPythonPackage rec {
  pname = "PyYAML";
  version = "5.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "15czj11s2bcgchn2jx81k0jmswf2hjxry5cq820h7hgpxiscfss3";
  };

  nativeBuildInputs = [ buildPackages.stdenv.cc ];

  propagatedBuildInputs = [ libyaml ];

  meta = with lib; {
    description = "The next generation YAML parser and emitter for Python";
    homepage = https://github.com/yaml/pyyaml;
    license = licenses.mit;
    maintainers = with maintainers; [ dotlambda ];
  };
}
