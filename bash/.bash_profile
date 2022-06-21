# ~/.bash_profile: executed by the command interpreter for login shells.

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin/appimage:$PATH"

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

init() {
    HAS_NVIDIA=$(lsmod | grep -c nvidia)

    if [ "$HAS_NVIDIA" -eq 0 ]; then
        exec sway
    else
        exec sway --unsupported-gpu
    fi
}

check_gui() {
    if [ -n "$DISPLAY" ] && [ "$(tty)" != "/dev/tty1" ]; then
        echo "Already in a graphical session."
        return 1
    fi
}

check_gui && init