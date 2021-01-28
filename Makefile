PREFIX ?= /usr

build:

install:
	install -d $(DESTDIR)$(PREFIX)/share/distro-info
	install -m 644 $(wildcard *.csv) $(DESTDIR)$(PREFIX)/share/distro-info

test:
	./validate-csv-data -d debian.csv
	./validate-csv-data -u ubuntu.csv

up-to-date:
	./up-to-date -d debian.csv
	./up-to-date -u ubuntu.csv

black:
	black validate-csv-data up-to-date lib/

.PHONY: black build install test up-to-date
