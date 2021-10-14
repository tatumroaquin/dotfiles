# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/.histfile
HISTSIZE=2000
SAVEHIST=5000
unsetopt beep
bindkey -v

zstyle :compinstall filename '/home/ormux/.zshrc'

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

[[ -f $HOME/.config/zsh/.zalias ]] && source $HOME/.config/zsh/.zalias
[[ -f $HOME/.config/zsh/.zfuncs ]] && source $HOME/.config/zsh/.zfuncs
