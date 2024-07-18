HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_space
setopt autocd nomatch

bindkey -v
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char

zstyle :compinstall filename '/home/kenny/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt MENU_COMPLETE

PROMPT="%K{blue}%F{black} %~ %#%k%F{blue} %f"

autoload -Uz compinit && compinit
compinit

if [ -f ~/.aliases ]; then
	source ~/.aliases
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(zoxide init zsh)"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

