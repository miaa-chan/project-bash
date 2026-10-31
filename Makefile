SHELL := /bin/bash

SCRIPT := project-bash
INSTALL_DIR := /usr/local/bin
INSTALL_NAME := pbash
REPO := https://github.com/miaa-chan/project-bash
TMP_DIR := $(shell mktemp -d)

.PHONY: all install uninstall update

all:
	@echo "Run 'make install' to install Project Bash."
	@echo "Run 'make update' to update Project Bash."

install:
	@test -f "$(SCRIPT)" || { echo "Error: $(SCRIPT) not found."; exit 1; }
	@echo "Installing Project Bash..."
	@sudo install -m 755 "$(SCRIPT)" "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@echo "Installed successfully. Run '$(INSTALL_NAME)'."

uninstall:
	@echo "Uninstalling Project Bash..."
	@sudo rm -f "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@echo "Uninstalled successfully."

update:
	@set -e
	@tmp=$$(mktemp -d)
	@trap 'rm -rf "$$tmp"' EXIT
	@echo "Updating Project Bash..."
	@git clone --depth 1 "$(REPO)" "$($tmp/repo)"
	@sudo install -m 755 "$(tmp/repo)/$(SCRIPT)" "$(INSTALL_DIR)/$(INSTALL_NAME)"
	@echo "Project Bash updated successfully."

