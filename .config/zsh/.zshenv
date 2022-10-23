export EDITOR="nvim"
export VISUAL="nvim"

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DATA_DIRS="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CONFIG_DIRS="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export PROMPT="%F{cyan}%n%F{white}@%F{green}%m %F{yellow}%1~%f"$'\n'"%# "
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_DATA_HOME/zsh/histfile"
export HISTSIZE=2000
export SAVEHIST=5000

export INPUTRC="$ZDOTDIR/inputrc"
export LESSHISTFILE="/dev/null"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export NVM_DIR="$HOME/.local/share/nvm"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export DOTNET_ROOT="$HOME/.dotnet"

export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"

#export PIPEWIRE_RUNTIME_DIR=`mktemp -d /tmp/$(id -u)-runtime-dir.XXX`
#export XDG_RUNTIME_DIR=`mktemp -d /tmp/$(id -u)-runtime-dir.XXX`
