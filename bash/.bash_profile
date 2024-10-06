# ~/.bash_profile: executed by the command interpreter for login shells.

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# git completion
. $HOME/.local/bin/git-completion.bash

# mcfly
eval "$(mcfly init bash)"

# broot
source $HOME/.config/broot/launcher/bash/br
