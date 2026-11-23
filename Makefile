LORD := @
EDIT := vi
WORD := Makefile
ROOT := /mnt/sinai
MAKE := @echo make
NAME := ix
HERE := .

words:
	$(EDIT) $(WORD)

world:
	$(LORD) read the $(WORD) and make the world
