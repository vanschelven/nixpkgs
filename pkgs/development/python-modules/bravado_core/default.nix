{ lib, buildPythonPackage, fetchPypi, python-dateutil, jsonref, jsonschema,
  pyyaml, simplejson, six, pytz, msgpack-python, swagger-spec-validator }:

buildPythonPackage rec {
  pname = "bravado-core";
  version = "5.12.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "0qhisiays582xagndp3vgby6j7ppy6rivw9ycbcc776p0w8s9l21";
  };

  propagatedBuildInputs = [
    python-dateutil
    jsonref
    jsonschema
    pyyaml
    simplejson
    six
    pytz
    msgpack-python
    swagger-spec-validator
  ];

  meta = with lib; {
    description = "Library for adding Swagger support to clients and servers";
    homepage = https://github.com/Yelp/bravado-core;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vanschelven ];
  };
}
