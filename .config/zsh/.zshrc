HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh

HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_space
setopt autocd nomatch

[[ -z $ZDOTDIR ]] && export ZDOTDIR="$HOME"

bindkey -v # vim keys
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
setopt MENU_COMPLETE

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

autoload -Uz promptinit && promptinit

fpath+=$ZDOTDIR/.zsh_functions

eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases
[ -f ~/.scripts/functions ] && source ~/.scripts/functions

PS1=" %~ %0(?.%F{blue}.%F{red})%f "

setopt SH_WORD_SPLIT

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
