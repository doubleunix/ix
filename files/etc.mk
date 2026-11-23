.PHONY: users shells
users:
	@cut -d: -f1,3,6,7 passwd

shells:
	@cat shells
