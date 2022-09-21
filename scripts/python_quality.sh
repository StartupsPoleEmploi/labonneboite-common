# /bin/bash
set -ex

mkdir testResults

# quality
poetry run flake8 --output-file testResults/flake8.txt || echo FAILED flake8
poetry run flake8_junit testResults/flake8.txt testResults/flake8.xml
rm testResults/flake8.txt

# unit test
poetry run pytest --verbose --junitxml=testResults/pytest.xml 

# coverage
poetry run coverage run -m pytest --verbose --junitxml=testResults/coverage.xml

# build the package
poetry build