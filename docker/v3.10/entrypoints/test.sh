# /bin/bash

# run the tests
# -- lint
poetry run flake8 --output-file flake8.txt || echo "FAILED flake"
poetry run flake8_junit flake8.txt flake8.xml
rm flake8.txt

# -- unit test & coverage
# -- api
poetry run pytest --junitxml=pytest.xml --cov --html=pytest.html
poetry run coverage xml

# -- build package
poetry build

# prepare test results
mkdir -p testResults
mv *.xml  ./testResults
mv *.html  ./testResults