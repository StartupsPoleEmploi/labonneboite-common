# /bin/bash
set -e



# build the package
poetry publish --build --username $PYPI_USERNAME --password $PYPI_PASSWORD

