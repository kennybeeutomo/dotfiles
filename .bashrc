#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

BLACK="\[$(tput setaf 0)\]"
BLUE="\[$(tput setaf 4)\]"
BLUEBG="\[$(tput setab 4)\]"
RESET="\[$(tput sgr0)\]"
PS1="${BLUEBG}${BLACK} \w \$${RESET}${BLUE} ${RESET}"

[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases

export HISTFILE="$XDG_STATE_HOME"/bash/history

source "${BASH_COMPLETION_USER_FILE:-~/.bash_completion}"/alacritty
eval "$(zoxide init bash)"
