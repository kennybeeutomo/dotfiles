# Defaults
export EDITOR=nvim
export PAGER=nvimpager

# XDG Base Directory
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}

export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export W3M_DIR="$XDG_STATE_HOME/w3m"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export PYTHON_HISTORY=$XDG_DATA_HOME/python_history/history
export PYTHONUSERBASE=$XDG_DATA_HOME/python
export PYTHONPYCACHEPREFIX=$XDG_CACHE_HOME/python
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export TS_NODE_HISTORY="$XDG_DATA_HOME"/ts_node_repl_history
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GOPATH="$XDG_DATA_HOME"/go
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export GHCUP_USE_XDG_DIRS=1
export MAVEN_OPTS=-Dmaven.repo.local="$XDG_DATA_HOME"/maven/repository
export MAVEN_ARGS="--settings $XDG_CONFIG_HOME/maven/settings.xml"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MARIADB_HISTFILE="$XDG_STATE_HOME"/mariadb_history
export ANDROID_HOME=/mnt/usb1/android

# Colors
export XRES_PATH="$HOME/.cache/wal/colors.Xresources"
source "$HOME/.cache/wal/colors.sh"

# Program Settings
export PYTHON_BASIC_REPL=1
export GRIM_DEFAULT_DIR="$HOME/Pictures/Screenshots"

# PATH
export PATH="${PATH}:$HOME/.local/bin"
export PATH="${PATH}:$HOME/.scripts"
export PATH="${PATH}:$GOPATH/bin"
export PATH="${PATH}:$XDG_DATA_HOME/cargo/bin"
export PATH="${PATH}:/opt/flutter/bin"
