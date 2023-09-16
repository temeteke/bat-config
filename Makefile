BIN_DIR := ~/.local/bin

VERSION := $(subst https://github.com/sharkdp/bat/releases/tag/v,,$(shell curl -s -w '%{redirect_url}' https://github.com/sharkdp/bat/releases/latest))
TARGET := x86_64-unknown-linux-gnu
TAR_NAME := bat-v$(VERSION)-$(TARGET)
TAR_FILE := $(TAR_NAME).tar.gz
TAR_URL := https://github.com/sharkdp/bat/releases/download/v$(VERSION)/$(TAR_FILE)

.PHONY: all clean install uninstall
all: $(TAR_NAME)

$(TAR_NAME): $(TAR_FILE)
	tar -xf $<

$(TAR_FILE):
	curl -L -o $@ $(TAR_URL)

clean:
	rm -f $(TAR_FILE)
	rm -fr $(TAR_NAME)

install: $(TAR_NAME) $(BIN_DIR)
	cp -a $(TAR_NAME)/bat $(BIN_DIR)/

uninstall:
	rm -f $(BIN_DIR)/bat

$(BIN_DIR):
	mkdir -p $@
