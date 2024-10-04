HISTFILE=$XDG_DATA_HOME/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/ormux/.config/zsh/.zshrc'

fpath=(~/.config/git/completions $fpath)
autoload -Uz compinit && compinit
zmodload zsh/complist
_comp_options+=(globdots)

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " (%b) "
precmd() { vcs_info }
setopt prompt_subst
prompt="[%F{cyan}%n%F{white}@%F{208}%m %F{yellow}%1~%F{reset_colour}]\${vcs_info_msg_0_}"$'\n'"%# "

autoload -Uz run-help
alias help="run-help"

[[ -f $HOME/.config/zsh/zalias ]] && source $HOME/.config/zsh/zalias
[[ -f $HOME/.config/zsh/zfuncs ]] && source $HOME/.config/zsh/zfuncs

# source pywal colorscheme
(cat ~/.cache/wal/sequences &)

# (NVM) Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="/home/tatum/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# miniconda
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
# [ -s ~/.local/miniconda3/etc/profile.d/conda.sh ] && source ~/.local/miniconda3/etc/profile.d/conda.sh
# conda config --set auto_activate_base false
# miniconda end

# plenv
export PATH="$PATH:$HOME/.plenv/bin"
eval "$(plenv init - $SHELL_NAME)"
# plenv end

# rbenv
export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init - ${SHELL##*/})"
# rbenv end

# mise
eval "$(/home/tatum/.local/bin/mise activate zsh)"
# mise end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/tatum/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/tatum/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/tatum/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/tatum/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

