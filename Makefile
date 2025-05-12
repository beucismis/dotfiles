USER_HOME := /home/$(USER)
DOTFILES_REPO := https://github.com/beucismis/dotfiles
DOTFILES_DIR := $(USER_HOME)/.dotfiles
PARU_DIR := $(USER_HOME)/.paru
BIN_DIR := $(USER_HOME)/.local/bin

.PHONY: all update install-git clone-dotfiles base-devel install-paru install-stow stow-files xdg-dirs create-dirs git-completion mpv-theme

all: update install-git clone-dotfiles base-devel install-paru install-stow stow-files xdg-dirs create-dirs git-completion mpv-theme

update:
	sudo pacman -Syu --noconfirm

install-git:
	if ! [ -x "$$(command -v git)" ]; then \
		echo "Installing git..."; \
		sudo pacman -S git --noconfirm; \
	fi

clone-dotfiles:
	git clone $(DOTFILES_REPO) $(DOTFILES_DIR)

base-devel:
	sudo pacman -S --needed base-devel

install-paru:
	git clone https://aur.archlinux.org/paru-git.git $(PARU_DIR)
	cd $(PARU_DIR) && makepkg -si

install-stow:
	if ! [ -x "$$(command -v stow)" ]; then \
		echo "Installing stow..."; \
		sudo pacman -S stow --noconfirm; \
	fi

stow-files:
	cd $(DOTFILES_DIR) && \
	sudo stow --adopt etc -t /etc/ && \
	sudo stow --adopt usr -t /usr/ && \
	stow --adopt bash fastfetch foot git mako mangohud pip qt5ct qt6ct radiotray-ng sway swaynag user-dirs waybar wob

xdg-dirs:
	sudo pacman -S xdg-user-dirs --noconfirm
	xdg-user-dirs-update

create-dirs:
	mkdir -p $(USER_HOME)/screenshots
	mkdir -p $(USER_HOME)/games
	mkdir -p $(USER_HOME)/projects
	mkdir -p $(USER_HOME)/clones
	mkdir -p $(USER_HOME)/area51
	mkdir -p $(BIN_DIR)

git-completion:
	rm -rf $(BIN_DIR)/git-completion.bash* $(BIN_DIR)/git-prompt.sh*
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -P $(BIN_DIR)
	wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -P $(BIN_DIR)
	chmod +rx $(BIN_DIR)/git-completion.bash $(BIN_DIR)/git-prompt.sh

mpv-theme:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/tomasklaen/uosc/HEAD/installers/unix.sh)"