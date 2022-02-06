# ~/.bash_profile: executed by the command interpreter for login shells.

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"

GREEN="\e[42m"
END="\e[m"
export PS1="$GREEN[\A] [\u@\h:\w]$END\n$ "

export NAME="beucismis"
export EMAIL="$NAME@tutamail.com"
