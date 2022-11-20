# Lines configured by zsh-newuser-install
unsetopt beep
bindkey -v
zstyle :compinstall filename '/home/tatum/.config/zsh/.zshrc'

fpath=($fpath ~/.config/git/completions)
_comp_options+=(globdots)

autoload -Uz compinit && compinit
autoload -U colors && colors

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats " (%b) "
precmd() { vcs_info }
setopt prompt_subst
prompt="%F{cyan}%n%F{208}@%F{040}%m %F{yellow}%1~%f\${vcs_info_msg_0_}"$'\n'"%# "

[ -f $ZDOTDIR/zalias ] && source $ZDOTDIR/zalias
[ -f $ZDOTDIR/zfuncs ] && source $ZDOTDIR/zfuncs

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
