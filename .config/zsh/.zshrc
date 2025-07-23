# ---- [ OPTIONS AND VARIABLES ] ----
[ -z $ZDOTDIR ] && export ZDOTDIR="$HOME"
HISTFILE="$XDG_STATE_HOME"/zsh/history
[ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh

HISTSIZE=1000000
SAVEHIST=1000000
KEYTIMEOUT=1

setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt SH_WORD_SPLIT
setopt IGNORE_EOF
setopt INTERACTIVE_COMMENTS

fpath+=$ZDOTDIR/.zsh_functions

# ---- [ COMPLETION ] ----
zmodload zsh/complist

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache
zstyle ':completion:*' menu select

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# ---- [ PROMPT ] ----
# Gets execution time
# Retrieved and modified from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
get-start-time() {
	start_time=$(date +%s%3N)
}

get-execution-time() {
	if [ $start_time ]; then
		local end_time=$(date +%s%3N)
		local elapsed=$(( $end_time - $start_time ))

		local second=1000
		local minute=60000
		local hour=3600000

		local elapsed_h=$(( $elapsed / $hour ))

		local elapsed_m=$(( $elapsed % $hour / $minute ))
		local elapsed_s=$(( $elapsed % $minute / $second ))
		local elapsed_ms=$(( $elapsed % $second ))

		local elapsed_fmt="%F{cyan}"

		[ $elapsed_h -ne 0 ] && elapsed_fmt+="${elapsed_h}h "
		[ $elapsed_m -ne 0 ] && elapsed_fmt+="${elapsed_m}m "
		[ $elapsed_s -ne 0 ] && elapsed_fmt+="${elapsed_s}s "
		[[ $elapsed_m -eq 0 && $elapsed_h -eq 0 ]] && elapsed_fmt+="${elapsed_ms}ms%f "

		echo -n "$elapsed_fmt"
	fi
}

get-git-branch() {
	if $(git rev-parse --is-inside-work-tree 2> /dev/null); then
		echo -n "%F{blue} $(git branch --show-current)%f "
	fi
}

get-prompt() {
	echo -n " "

	get-execution-time

	echo -n "%~ "

	get-git-branch

	echo -n "%0(?.%F{blue}.%F{red})%f "
}

preexec() {
	get-start-time
}

precmd() {
	PS1="$(get-prompt)"
}

# ---- [ ZLE WIDGETS ] ----

# bar cursor for vi insert mode
zle-line-init zle-keymap-select() {
	case $KEYMAP in
		viins|main ) printf '\e[6 q' ;;
		vicmd ) printf '\e[2 q' ;;
	esac
}
zle -N zle-keymap-select
zle -N zle-line-init

zle-yazi() {
	zle kill-buffer
	BUFFER='y'
	zle accept-line
}
zle -N zle-yazi

# ---- [ KEY MAPPINGS ] ----

bindkey -v # vim keys
bindkey -M viins "^H"      backward-kill-word
bindkey -M viins "^?"      backward-delete-char
bindkey -M viins "\e[3~"   delete-char
bindkey -M viins "^E"      execute-named-cmd
bindkey -M viins "^K"      menu-select
bindkey -M menuselect "^H" vi-backward-char
bindkey -M menuselect "^J" down-line-or-history
bindkey -M menuselect "^K" up-line-or-history
bindkey -M menuselect "^L" vi-forward-char
bindkey -M viins "^[^M"    self-insert-unmeta
bindkey -M vicmd "^[^M"    self-insert-unmeta
bindkey -M viins "^Y"      zle-yazi
bindkey -M vicmd "^Y"      zle-yazi

# ---- [ ALIASES ] ----
[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases
[ -f ~/.scripts/utils ] && source ~/.scripts/utils

# ---- [ PLUGINS AND INTEGRATIONS ] ----

# zoxide integration
eval "$(zoxide init zsh)"

# zsh plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

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
eval $(dircolors)

# must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- [ STARTUP COMMANDS ] ----

# pfetch every startup except in nvim terminal
[ -n "$NOFETCH" ] || [ "$TERM" = 'xterm-256color' ] || pfetch
