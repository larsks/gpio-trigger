sysconfdir = /etc
unitdir = /etc/systemd/system

UNITS = gpio-trigger@.service

all:

install: install-units install-dirs

install-units: $(UNITS)
	install -m 755 -d $(DESTDIR)$(unitdir)
	for unit in $(UNITS); do \
		install -m 644 $$unit $(DESTDIR)$(unitdir); \
	done

install-dirs:
	install -m 755 -d $(DESTDIR)$(sysconfdir)/gpio-trigger
