USER_HOME := $(shell echo ~)
DOTFILES_DIR := $(USER_HOME)/.dotfiles
PARU_DIR := $(USER_HOME)/.paru
BIN_DIR := $(USER_HOME)/.local/bin
STOW_DIRS := $(shell find * -maxdepth 0 -type d -not -name "etc" -not -name "usr" -not -name "boot" -not -name "packages" -not -name "scripts" -not -name ".git" -not -name "gtk-2.0" -not -name "gtk-3.0" -not -name "gtk-4.0")
ALL_PKGS := packages/base.txt packages/cli.txt packages/dev.txt packages/nvidia.txt packages/game.txt packages/privacy.txt packages/ai.txt packages/extra.txt packages/nonfree.txt

.PHONY: all install-system-deps install-packages stow-files setup-shell setup-dirs install-mpv-plugins install-icon-theme

all: install-system-deps install-packages stow-files setup-shell setup-dirs install-mpv-plugins install-icon-theme

install-system-deps:
	@echo "Installing system dependencies..."
	sudo pacman -Syu --needed --noconfirm git base-devel stow xdg-user-dirs

install-packages:
	@echo "Installing all packages..."
	@if ! [ -x "$$(command -v paru)" ]; then \
		echo "paru not found, installing..."; \
		git clone https://aur.archlinux.org/paru-git.git $(PARU_DIR); \
		(cd $(PARU_DIR) && makepkg -si --noconfirm); \
	fi
	paru -S --needed --noconfirm - < <(cat $(ALL_PKGS))

stow-files:
	@echo "Stowing configuration files..."
	cd $(DOTFILES_DIR) && sudo stow --adopt -t /etc etc
	cd $(DOTFILES_DIR) && sudo stow --adopt -t /usr usr
	sudo cp -rT $(DOTFILES_DIR)/boot /boot
	cd $(DOTFILES_DIR) && stow --adopt -t $(USER_HOME) $(STOW_DIRS)
	sudo chown -R $(USER):$(USER) $(DOTFILES_DIR)
	sudo chmod -R 644 $(DOTFILES_DIR)/etc
	sudo chmod 755 $(DOTFILES_DIR)/etc

setup-shell:
	@echo "Setting up the shell..."
	rm -rf $(BIN_DIR)/git-completion.bash* $(BIN_DIR)/git-prompt.sh*
	wget -q --show-progress https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P $(BIN_DIR)
	wget -q --show-progress https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -P $(BIN_DIR)
	chmod +rx $(BIN_DIR)/git-completion.bash $(BIN_DIR)/git-prompt.sh

setup-dirs:
	@echo "Setting up user directories..."
	mkdir -p $(USER_HOME)/documents $(USER_HOME)/download $(USER_HOME)/music $(USER_HOME)/pictures $(USER_HOME)/public $(USER_HOME)/templates $(USER_HOME)/videos
	xdg-user-dirs-update
	mkdir -p $(USER_HOME)/screenshots $(USER_HOME)/games $(USER_HOME)/projects $(USER_HOME)/clones $(USER_HOME)/area51 $(USER_HOME)/sync $(BIN_DIR)

install-mpv-plugins:
	@echo "Installing mpv plugins..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)"
	TMP_DIR=$$(mktemp -d); \
	git clone https://github.com/po5/thumbfast $$TMP_DIR; \
	cp $$TMP_DIR/thumbfast.lua $(USER_HOME)/.config/mpv/scripts/; \
	cp $$TMP_DIR/thumbfast.conf $(USER_HOME)/.config/mpv/script-opts/; \
	rm -rf $$TMP_DIR

install-icon-theme:
	@echo "Installing icon theme..."
	ICONS_DIR=$(USER_HOME)/.icons; \
	mkdir -p $$ICONS_DIR; \
	cd $$ICONS_DIR; \
	git clone https://git.disroot.org/eudaimon/buuf-nestort.git
