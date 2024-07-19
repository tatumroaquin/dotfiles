export ZDOTDIR="$HOME/.config/zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="/dev/null"
export PASSWORD_STORE_DIR="$HOME/.local/share/.password-store"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"
export CLICOLOR="1"
export EDITOR="nvim"
export VISUAL="nvim"
export SYSTEMD_EDITOR="nvim"
export NVM_DIR="$XDG_DATA_HOME/nvm"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export XINITRC="$XDG_CONFIG_HOME/x/xinitrc"

export SCRIPTS="$HOME/.scripts/sh"
export DOTNET_ROOT="$HOME/.dotnet"
export DOTNET_TOOLS="$HOME/.dotnet/tools"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"
export CARGO_BIN="$HOME/.cargo/bin"

export PATH="$SCRIPTS:$DOTNET_ROOT:$DOTNET_TOOLS:$CARGO_BIN:$PATH"

PATH="/home/tatum/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/tatum/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/tatum/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/tatum/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/tatum/perl5"; export PERL_MM_OPT;
