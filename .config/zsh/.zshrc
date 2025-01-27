HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh

HISTSIZE=1000000
SAVEHIST=1000000
KEYTIMEOUT=1

setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt SH_WORD_SPLIT
setopt IGNORE_EOF
setopt MENU_COMPLETE

[[ -z $ZDOTDIR ]] && export ZDOTDIR="$HOME"

function zle-line-init zle-keymap-select {
	case $KEYMAP in
		viins|main ) printf '\e[6 q' ;;
		vicmd ) printf '\e[2 q' ;;
	esac
}

zle -N zle-keymap-select
zle -N zle-line-init

bindkey -v # vim keys
bindkey -M viins "^H" backward-kill-word
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "\e[3~" delete-char

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

autoload -Uz promptinit && promptinit

fpath+=$ZDOTDIR/.zsh_functions

eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases
[ -f ~/.scripts/functions ] && source ~/.scripts/functions

PS1=" %~ %0(?.%F{blue}.%F{red})%f "

# yazi integration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# don't pfetch in nvim
[[ $TERM = 'xterm-256color' ]] || pfetch

# must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
