PACKAGE_DIR = labonneboite_common

PIP_COMPILE_ARGS ?=

TESTS_OPTS ?= 
TEST = pytest $(TESTS_OPTS)
TESTS = labonneboite_common/


init: init-venv

init-venv:
	@test -n "${VENV}${VIRTUAL_ENV}" -a \( -e "${VENV}" -o -e "${VIRTUAL_ENV}" \) || (echo 'You are not in a virtual env. Continue ? ' && read r)
	pip install --upgrade pip
	pip install pip-tools
	${MAKE} requirements.dev.txt
	pip-sync requirements.dev.txt

# Requirements
# ------------

compile-requirements: requirements.txt
compile-dev-requirements: requirements.dev.txt

requirements.dev.txt: requirements.txt

.SUFFIXES: .in .txt
.in.txt:
	pip-compile ${PIP_COMPILE_ARGS} -o $@ -v $<

# Cleanup
# -------

clean:
	find $(PACKAGE_DIR) "(" -name "*.pyc" -or -name "*.pyo" -or -name "*.mo" -or -name "*.so" ")" -delete
	find $(PACKAGE_DIR) -type d -empty -delete
	find $(PACKAGE_DIR) -name __pycache__ -delete

clean-pyc:
	find $(PACKAGE_DIR) "(" -name "*.pyc" ")" -delete

clean-services: stop-services ## Delete containers and attached volumes
	docker-compose rm --force -v

# Code quality
# ------------

# Run pylint on the whole project.
lint:
	pylint --rcfile=.pylintrc --reports=no --output-format=colorized $(PACKAGE_DIR)

# Tests
# -----
test: clean-pyc
	$(TEST) ${TESTS}
