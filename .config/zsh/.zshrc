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

fpath+=$ZDOTDIR/.zsh_functions

# ---- [ COMPLETION ] ----
zmodload zsh/complist

zstyle :compinstall filename "$ZDOTDIR/.zshrc"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive completion
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION

# ---- [ PROMPT ] ----
local prompt_fmt="%~ %0(?.%F{blue}.%F{red})%f "
PS1=" $prompt_fmt"

# Gets execution time
# Retrieved and modified from https://gist.github.com/knadh/123bca5cfdae8645db750bfb49cb44b0
function preexec() {
	start_time=$(date +%s%3N)
}

function precmd() {
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

		PS1="%F{cyan} "

		[ $elapsed_h -ne 0 ] && PS1+="${elapsed_h}h "
		[ $elapsed_m -ne 0 ] && PS1+="${elapsed_m}m "
		[ $elapsed_s -ne 0 ] && PS1+="${elapsed_s}s "
		PS1+="${elapsed_ms}ms%f "
		PS1+="$prompt_fmt"
	fi

	unset start_time
}

# ---- [ ZLE WIDGETS ] ----

# bar cursor for vi insert mode
function zle-line-init zle-keymap-select {
	case $KEYMAP in
		viins|main ) printf '\e[6 q' ;;
		vicmd ) printf '\e[2 q' ;;
	esac
}

zle -N zle-keymap-select
zle -N zle-line-init

# menu selection with vi keys
function vi-menu-select {
	zle vi-cmd-mode
	zle menu-select
	zle vi-add-next
}

zle -N vi-menu-select

# ---- [ KEY MAPPINGS ] ----

bindkey -v # vim keys
bindkey -M viins "^H"      backward-kill-word
bindkey -M viins "^?"      backward-delete-char
bindkey -M viins "\e[3~"   delete-char
bindkey -M viins "^E"      execute-named-cmd
bindkey -M viins "^K"      vi-menu-select

# ---- [ ALIASES ] ----
[ -f ~/.scripts/aliases ] && source ~/.scripts/aliases
[ -f ~/.scripts/functions ] && source ~/.scripts/functions

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

# must be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- [ STARTUP COMMANDS ] ----

# don't pfetch in nvim
[ "$TERM" = 'xterm-256color' ] || pfetch
