# ~/.bash_profile: executed by the command interpreter for login shells.

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin/appimage:$PATH"

GREEN="\e[32m"
BOLD="\e[1m"
END="\e[0m"
export PS1="[$GREEN$BOLD\u$END@$GREEN$BOLD\h$END \w]\n$ "