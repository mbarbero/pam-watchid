VERSION = 3
LIBRARY_NAME = pam_watchid.so
DESTINATION = /usr/local/lib/pam
TARGET = $(shell clang -dumpmachine)

all:
	swiftc watchid-pam-extension.swift -O -o $(LIBRARY_NAME) -target $(TARGET) -emit-library

install: all
	mkdir -p $(DESTINATION)
	sudo install -o root -g wheel -m 444 $(LIBRARY_NAME) $(DESTINATION)/$(LIBRARY_NAME).$(VERSION)
