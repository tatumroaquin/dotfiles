unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/tatum/.config/zsh/.zshrc'

autoload -Uz compinit
compinit

[ -f $ZDOTDIR/zalias ] && source $ZDOTDIR/zalias
[ -f $ZDOTDIR/zfuncs ] && source $ZDOTDIR/zfuncs

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
