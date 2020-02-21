{ lib, buildPythonPackage, fetchPypi, python-dateutil, jsonref, jsonschema,
  pyyaml, simplejson, six, pytz, msgpack, swagger-spec-validator, rfc3987,
  strict-rfc3339, webcolors, mypy_extensions }:

buildPythonPackage rec {
  pname = "bravado-core";
  version = "5.16.1";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1vcc5wz8xbhhgd1yvdi8cdvrnkzkb8ycshsgyfisqsrvklbiss72";
  };

  checkInputs = [
    mypy_extensions
  ];

  propagatedBuildInputs = [
    python-dateutil
    jsonref
    jsonschema
    pyyaml
    simplejson
    six
    pytz
    msgpack
    swagger-spec-validator

    # the following 3 packages are included when jsonschema (2.6) is installed
    # as jsonschema[format], which reflects what happens in setup.py
    rfc3987
    strict-rfc3339
    webcolors
  ];

  meta = with lib; {
    description = "Library for adding Swagger support to clients and servers";
    homepage = https://github.com/Yelp/bravado-core;
    license = licenses.bsd3;
    maintainers = with maintainers; [ vanschelven ];
  };
}
