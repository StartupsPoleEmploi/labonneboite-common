# /bin/bash
set -ex

# quality
poetry run flake8 --output-file flake8.txt || echo "FAILED flake"
poetry run flake8_junit flake8.txt flake8.xml
rm flake8.txt

# unit test
poetry run pytest --verbose --junitxml=pytest.xml  || echo "FAILED unit test"

# coverage
# poetry run coverage run -m pytest --verbose --junitxml=coverage.xml

# build the package
poetry build