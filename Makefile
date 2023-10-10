test:
	pytest

coverage:
	pytest -s --cov --cov-report html --cov-fail-under 100

yamllint:
	yamllint -d relaxed .

black:
	black .

build:
	python -m build

install:
	make build
	pip install dist/*.whl

uninstall:
	pip uninstall django-dry-tests
	rm -rf dist
	rm -rf django_dry_tests.egg-info

reinstall:
	make uninstall
	make install

pylint:
	pylint $(shell git ls-files '*.py')

lint:
	make yamllint
	make pylint