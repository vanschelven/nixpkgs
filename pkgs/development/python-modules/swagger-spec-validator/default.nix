{ lib, buildPythonPackage, fetchPypi, pyyaml, jsonschema, six }:

buildPythonPackage rec {
  pname = "swagger-spec-validator";
  version = "2.4.3";

  src = fetchPypi {
    inherit pname version;
    sha256 = "57e29feb3aa921a9fb98bd70af148746b27c77d3207266f5571cebcce211e685";
  };

  propagatedBuildInputs = [
    pyyaml
    jsonschema
    six
  ];

  meta = with lib; {
    homepage = "http://github.com/Yelp/swagger_spec_validator";
    license = licenses.asl20;
    description = "Validation of Swagger specifications";
    maintainers = with maintainers; [ vanschelven ];
  };
}


