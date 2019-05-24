{ stdenv
, buildPythonPackage
, fetchPypi
}:

buildPythonPackage rec {
  pname = "applicationinsights";
  version = "0.11.9";

  src = fetchPypi {
    inherit pname version;
    sha256 = "30a11aafacea34f8b160fbdc35254c9029c7e325267874e3c68f6bdbcd6ed2c3";
  };

  checkInputs = [ ];
  propagatedBuildInputs = [ ];

  doCheck = true;

  meta = with stdenv.lib; {
    homepage = "https://github.com/Microsoft/ApplicationInsights-Python";
    license = licenses.mit;
    description = "This project extends the Application Insights API surface to support Python.";
    maintainers = with maintainers; [ vanschelven ];
  };
}
