# SPDX-License-Identifier: GPL-3.0-or-later
INSTALL ?= install

.PHONY: all
all:

.PHONY: install install-pass install-git
install: install-pass install-git

install-pass :
	$(INSTALL) pass $(DESTDIR)/usr/bin/pass
	$(INSTALL) -Dt $(DESTDIR)/usr/lib/pass pass-*

install-git : install-pass
	$(INSTALL) -Dt $(DESTDIR)/usr/lib/git-core git-*

.PHONY: uninstall uninstall-pass uninstall-git
uninstall: uninstall-pass uninstall-git

uninstall-pass :
	for f in pass-*; do \
		$(RM) $(DESTDIR)/usr/lib/pass/$f \
	done
	$(RM) -d $(DESTDIR)/usr/lib/pass

uninstall-git :
	for f in git-*; do \
		$(RM) $(DESTDIR)/usr/lib/git-core/$f \
	done
