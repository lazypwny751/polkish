PREFIX := /usr
BINDIR := $(PREFIX)/bin
LIBDIR := $(PREFIX)/local/lib/bash/5.1

install:
	mkdir -vp $(BINDIR) $(LIBDIR)
	install -vm 755 polkish.sh $(LIBDIR)/polkish.sh
	ln -s $(LIBDIR)/polkish.sh $(BINDIR)/polkish

uninstall:
	rm -vf $(LIBDIR)/polkish.sh $(BINDIR)/polkish

reinstall: uninstall install

.PHONY: install uninstall reinstall
