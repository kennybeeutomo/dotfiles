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

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

source ~/.bash_completion/alacritty
eval "$(zoxide init bash)"
