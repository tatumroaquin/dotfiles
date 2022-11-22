unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tatum/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " (%b) "
precmd() { vcs_info }
setopt prompt_subst

# run-help manuals about shell defaults
autoload -Uz run-help
unalias run-help
alias help="run-help"

[ -f $ZDOTDIR/zalias ] && source $ZDOTDIR/zalias
[ -f $ZDOTDIR/zfuncs ] && source $ZDOTDIR/zfuncs

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
