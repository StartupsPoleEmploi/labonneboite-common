# /bin/bash

testReturn=0

failed() {
    testReturn=1
    echo "FAILED $1"
}

set -x

# run the tests
# -- lint
if ! poetry run flake8 --output-file flake8.txt
then
    failed "flake";
    poetry run flake8_junit flake8.txt flake8.xml && echo;
    rm flake8.txt;
fi

# -- type checking
if ! poetry run mypy --junit-xml ./mypy.xml .
then
    failed "mypy";
fi

# -- unit test & coverage
# -- api
if poetry run pytest --junitxml=pytest.xml --cov --html=pytest.html
then
    poetry run coverage xml
else
    failed "pytest"
fi

# -- build package
if ! poetry build
then
    failed "build"
fi

# prepare test results
echo "Moving test results file..."
mkdir -p testResults
mv *.xml  ./testResults
mv *.html  ./testResults
echo "Done"

exit $testReturn