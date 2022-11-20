
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export HISTFILE="$XDG_DATA_HOME/zsh/.histfile"
export HISTSIZE=3000
export SAVEHIST=5000

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DISPLAY="`grep nameserver /etc/resolv.conf | awk '{print $2}'`:0.0"

export NVM_DIR="$XDG_DATA_HOME/nvm"
export NVM_BIN="$XDG_DATA_HOME/node"

export SUDO_EDITOR="/usr/bin/nvim"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

export LESSHISTFILE="/dev/null"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export CLI_COLOR=1
export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export LOCAL_BIN="$HOME/.local/bin"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_TOOLS="$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PATH="$PATH:$LOCAL_BIN:$DOTNET_ROOT:$DOTNET_TOOLS"
