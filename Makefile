PREFIX ?= /usr
PYTHON_SOURCES=lib up-to-date validate-csv-data

build:

install:
	install -d $(DESTDIR)$(PREFIX)/share/distro-info
	install -m 644 $(wildcard *.csv) $(DESTDIR)$(PREFIX)/share/distro-info

test:
	./validate-csv-data $(DATADIR)debian.csv
	./validate-csv-data $(DATADIR)devuan.csv
	./validate-csv-data $(DATADIR)elxr.csv
	./validate-csv-data $(DATADIR)ubuntu.csv

up-to-date:
	./up-to-date $(DATADIR)debian.csv
	./up-to-date $(DATADIR)devuan.csv
	./up-to-date $(DATADIR)elxr.csv
	./up-to-date $(DATADIR)ubuntu.csv

lint: isort black mypy pylint

black:
	black -C --check --diff $(PYTHON_SOURCES)

isort:
	isort --check-only --diff $(PYTHON_SOURCES)

mypy:
	mypy --scripts-are-modules $(PYTHON_SOURCES)

pylint:
	pylint $(PYTHON_SOURCES)

.PHONY: black build install isort lint mypy pylint test up-to-date
