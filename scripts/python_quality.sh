# /bin/bash
set -e

poetry install

mkdir testResults

# quality
flake8 --output-file testResults/flake8.txt labonneboite_common 
flake8_junit testResults/flake8.txt testResults/flake8.xml
rm testResults/flake8.txt

# unit test
pytest --verbose --junitxml=testResults/pytest.xml 

# coverage
coverage run -m pytest --verbose --junitxml=testResults/coverage.xml

# build the package
poetry build