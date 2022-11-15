HISTFILE=$XDG_DATA_HOME/zsh/.histfile
HISTSIZE=2000
SAVEHIST=5000
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
unalias run-help
alias help="run-help"

[[ -f $HOME/.config/zsh/.zalias ]] && source $HOME/.config/zsh/.zalias
[[ -f $HOME/.config/zsh/.zfuncs ]] && source $HOME/.config/zsh/.zfuncs

# (NVM) Node Version Manager
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
