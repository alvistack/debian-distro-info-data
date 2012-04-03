PREFIX ?= /usr

build:

install:
	install -d $(DESTDIR)$(PREFIX)/share/distro-info
	install -m 644 $(wildcard *.csv) $(DESTDIR)$(PREFIX)/share/distro-info

test:
	./validate-csv-data -d debian.csv
	./validate-csv-data -u ubuntu.csv

.PHONY: build install test
