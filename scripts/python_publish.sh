# /bin/bash
set -e

# apply the version request by user
poetry version $CI_COMMIT_TAG

# build the package
poetry publish --build --username $PYPI_USERNAME --password $PYPI_PASSWORD

