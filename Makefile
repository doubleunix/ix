.DEFAULT_GOAL := help
ROOT ?= /mnt/sinai
PREFIX ?= /usr/local
COMMAND ?=
OUT ?= $(CURDIR)/build
IMAGE ?= ix:local
ENGINE ?= docker
GIT_ROOT ?= https://github.com
HOME_TREE ?= $(if $(wildcard ../../../ports.mk),$(abspath ../../..),$(OUT)/root)
HOME_TREE := $(abspath $(HOME_TREE))
SOURCES ?= $(HOME_TREE)/src
IX := $(CURDIR)
ARCH ?= $(shell uname -m)
KERNEL ?= $(OUT)/vmlinuz-virt
QEMU ?= qemu-system-$(ARCH)
QEMU_FLAGS ?= -m 512 -nographic -no-reboot

export OUT ENGINE IMAGE GIT_ROOT HOME_TREE SOURCES ROOT ARCH KERNEL

.PHONY: help world chroot boot iso container check install distro-nixos distro-arch distro-gentoo
help:
	@printf '%s\n' 'make world | chroot | boot | iso | container' \
		'make distro-nixos | distro-arch | distro-gentoo' 'make check'

$(OUT)/base/.ix-base: Dockerfile.base
	@bin/ix base

world iso container check: $(OUT)/base/.ix-base
	@bin/ix $@

chroot: $(OUT)/base/.ix-base
	@bin/ix chroot $(COMMAND)

boot: $(OUT)/base/.ix-base
	@bin/ix boot
	$(QEMU) $(QEMU_FLAGS) -kernel "$(KERNEL)" -initrd "$(OUT)/ix.cpio.gz" \
		-append 'console=ttyS0,115200' -nic user,model=virtio-net-pci

distro-nixos:
	@bin/ix distro nixos nixos/nix:latest
distro-arch:
	@bin/ix distro arch archlinux:base
distro-gentoo:
	@bin/ix distro gentoo gentoo/stage3:amd64-openrc

install:
	install -d "$(DESTDIR)$(PREFIX)/share/doc/ix"
	install -m 644 README.md "$(DESTDIR)$(PREFIX)/share/doc/ix/README.md"
