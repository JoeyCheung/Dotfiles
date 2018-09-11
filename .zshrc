#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

##########
# alias' #
##########

# common shortcut
alias clock='tty-clock -c -C 2 -t'
alias reboot='sudo systemctl reboot'
alias poweroff='sudo systemctl poweroff'

# Directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
