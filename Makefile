INSTALL := install

SCRIPTS = $(wildcard scripts/*)
UNITS = $(wildcard units/*)

all:
clean:

install:
	$(INSTALL) -d -m 755 $(DESTDIR)/usr/lib/systemd/system/sysinit.target.wants
	$(INSTALL) -D -m 644 $(UNITS) $(DESTDIR)/usr/lib/systemd/system/
	$(INSTALL) -D -m 755 $(SCRIPTS) $(DESTDIR)/usr/lib/systemd/
	$(INSTALL) -D -m 644 README.gpios $(DESTDIR)/usr/lib/gpios.d/README
	ln -fs ../gpio.service $(DESTDIR)/usr/lib/systemd/system/sysinit.target.wants/gpio.service

.PHONY: all clean install
