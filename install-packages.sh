#!/bin/zsh

####################
# Download prezto
####################

if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      sudo chsh -s $(which zsh)
fi

####################
