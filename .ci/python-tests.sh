# /bin/bash
set -e

# quality
flake8 labonneboite_common/ --exclude tests || echo 'FAILED LINT'

# unit tests
pytest --verbose --junitxml=pytest.xml  || echo 'FAILED UNIT TESTS'

coverage run -m pytest --verbose --junitxml=pytest.xml  || echo 'FAILED UNIT TESTS'

