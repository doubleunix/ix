.DEFAULT_GOAL := help
.PHONY: help enterprise list install shell
help:
	@printf '%s\n' 'make enterprise        fetch the source tree' \
		'make list              list ports' 'make install PORT=ORG/REPO' \
		'make shell             speak to YHWH' 'man @                  read the manual'

enterprise list install:
	+@$(MAKE) --no-print-directory -f /lib/ix/ports.mk $@

shell:
	@exec yhwh shell
