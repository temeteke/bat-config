VERSION := 0.23.0
TARGET := x86_64-unknown-linux-gnu
TAR_NAME := bat-v$(VERSION)-$(TARGET)
TAR_FILE := $(TAR_NAME).tar.gz
TAR_URL := https://github.com/sharkdp/bat/releases/download/v$(VERSION)/$(TAR_FILE)

.PHONY: all clean install uninstall
all: bat

bat: $(TAR_NAME)
	cp $(TAR_NAME)/bat bat

$(TAR_NAME): $(TAR_FILE)
	tar -xf $<

$(TAR_FILE):
	curl -L -o $@ $(TAR_URL)

clean:
	rm -f bat
	rm -f $(TAR_FILE)
	rm -fr $(TAR_NAME)

install: bat
	cp $^ ~/.local/bin/

uninstall:
	rm ~/.local/bin/bat
