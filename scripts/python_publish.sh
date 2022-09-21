# /bin/bash
set -e

poetry install

# build the package
poetry publish --build --username $PYPI_USERNAME --password $PYPI_PASSWORD

