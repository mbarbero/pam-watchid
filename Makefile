VERSION = 3
LIBRARY_NAME = pam_watchid.so
DESTINATION = /usr/local/lib/pam
SUDO_LOCAL = /etc/pam.d/sudo_local
TARGET = $(shell clang -dumpmachine)

all:
	swiftc watchid-pam-extension.swift -O -o $(LIBRARY_NAME) -target $(TARGET) -emit-library

install: all
	sudo mkdir -p $(DESTINATION)
	sudo install -o root -g wheel -m 444 $(LIBRARY_NAME) $(DESTINATION)/$(LIBRARY_NAME).$(VERSION)
	sudo ln -sf $(DESTINATION)/$(LIBRARY_NAME).$(VERSION) $(DESTINATION)/$(LIBRARY_NAME)
	sudo ./enable.sh $(SUDO_LOCAL) $(DESTINATION)/$(LIBRARY_NAME)