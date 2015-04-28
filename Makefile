INSTALL := install

UNITS = $(wildcard units/*)

all:
clean:

install:
	$(INSTALL) -d -m 755 $(DESTDIR)/usr/lib/systemd/system/sysinit.target.wants
	$(INSTALL) -D -m 644 $(UNITS) $(DESTDIR)/usr/lib/systemd/system/

.PHONY: all clean install
