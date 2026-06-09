#!/bin/bash
# ~/.bash_profile: executed by the command interpreter for login shells.

for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f "$HOME/.local/bin/git-completion.bash" ]; then
    . "$HOME/.local/bin/git-completion.bash"
fi

if command -v mcfly &> /dev/null; then
    eval "$(mcfly init bash)"
fi

if [ -f "$HOME/.config/broot/launcher/bash/br" ]; then
    source "$HOME/.config/broot/launcher/bash/br"
fi

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - bash)"

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec sway --unsupported-gpu
fi
