# /bin/bash
set -e

mkdir tests

# quality
flake8 --output-file tests/flake8.txt labonneboite_common 
flake8_junit tests/flake8.txt tests/flake8.xml
rm tests/flake8.txt
# unit tests
pytest --verbose --junitxml=tests/pytest.xml 

# coverage
coverage run -m pytest --verbose --junitxml=tests/coverage.xml


