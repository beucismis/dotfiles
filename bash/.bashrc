# ~/.bashrc: executed by bash(1) for non-login shells.

[ -z "$PS1" ] && return
[ -n "$PS1" ] && source ~/.bash_profile;

clear-screen-keep-sb() {
    printf '\e[%dS' $((LINES-1))
    tput -x clear
}

bind -x '"\C-l":"clear-screen-keep-sb"'

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}

PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd
