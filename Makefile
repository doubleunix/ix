LORD := @
EDIT := vi
WORD := Makefile
ROOT := /mnt/sinai
MAKE := @echo make
NAME := ix
HERE := .

words:
	$(EDIT) $(WORD)

make:
	$(MAKE) the syntax of this file be a generalized make.
	$(MAKE) the world it describes when 'make world' runs.
	$(MAKE) sense of the terms and syntax below as you go.
	$(MAKE) sure you ask the user questions when not sure.
	$(MAKE) sure not to worry, it's ok if you break stuff.
	$(MAKE) note: that we're writing in a declarative way.
	$(MAKE) note: all your changes can be declarative too.

src:
	$(MAKE) the a dir called src in this repo.
	$(MAKE) the following sub directories of ./src/

src-yhwh:
	$(MAKE) src/yhwh be a python pkg like ~/git/mine/embd
	$(MAKE) it have same type of Makefile and pyproject.toml
	$(MAKE) it should be essentially just 'lordhavemercy -f'
	$(MAKE) it have a python importable and executable `yhwh`
	$(MAKE) 
	$(MAKE) src/lord bin have the lord system, it's now in ~/Desktop/@

dst:
	$(MAKE) $(ROOT) be the root of the new os we're making.
	$(MAKE) note that the stuff below all goes in $(ROOT)

# now we mentally chroot into: $(ROOT)
# but don't really do the chroot just yet.

bin:
	$(MAKE) bin in the spirit of busybox, toybox & early unix.
	$(MAKE) bin have the lord system, it's now in ~/Desktop/@
	$(MAKE) sh be the toybox shell and make bash be real bash.
	$(MAKE) bash be the default shell, for both root and user.

etc:
	$(MAKE) etc be simple and elegant and not cluttered
	$(MAKE) etc/issue explain the lord system & how to use @
	$(MAKE) ibid have the logo LꞀ in it somewhere
	$(MAKE) two users for the system named root and user
	$(MAKE) root have uid 0 and user have uid 1.

lib:
	$(MAKE) musl libc be the c library for the system
	$(MAKE) the system have the latest python and ipython

ix:
	$(MAKE) sure to read ~/obsidian/YHWH/create-the-world.md
	$(MAKE) note: that's the prompt that made /mnt/sinai/*
	$(MAKE) sure to read that file to get a sense of our values

pkg:
	$(MAKE) yhwh be the package manager of the new system.
	$(MAKE) yhwh work in the manner described below.

src:
	$(MAKE) 
	$(MAKE) yhwh be the package manager of the new system.
	$(MAKE) yhwh is basically the highest level lord command.
	$(MAKE) 
	$(MAKE) all packages will be installed by asking in prose.
	$(MAKE) lord use nix behind the scenes to handle this.

run:
	$(LORD) chroot into the system

# now we mentally exit the chroot from $(ROOT)
# and now we're mentally back inside $(NAME)

yhwh:
	$(MAKE) a copy of ~/obsidian/YHWH/ inside of $(ROOT)/src
	$(MAKE) a 
	$(MAKE) yhwh install the source code of gentoos emerge package manager into /src

world:
	$(LORD) read the $(WORD) and make the world
