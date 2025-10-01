#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BLUE="\[$(tput setaf 4)\]"
RESET="\[$(tput sgr0)\]"
PS1=" \w ${BLUE}\$ ${RESET}"

[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases
[ -f ~/.scripts/utils ] && source ~/.scripts/utils

export HISTFILE="$XDG_STATE_HOME"/bash/history

# yazi integration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ls colors for fd
eval "$(dircolors)"

source "${BASH_COMPLETION_USER_FILE:-~/.bash_completion}"/alacritty
eval "$(zoxide init bash)"
