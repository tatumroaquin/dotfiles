#!/bin/zsh

export NVM_DIR=$XDG_DATA_HOME/nvm
export NVM_BIN=$XDG_DATA_HOME/node

mkdir -p $NVM_DIR $NVM_BIN

touch $HOME/.zshrc

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | zsh

cat $HOME/.zshrc >> $ZDOTDIR/.zshrc

rm $HOME/.zshrc
