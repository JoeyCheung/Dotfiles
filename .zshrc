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
alias rmdir='rm -rf'
alias wifi='nmcli device wifi'
alias trash=' rm -rf ~/.local/share/Trash/*'
alias connect='source connectToWifi.sh' #Type wifi name then password
alias school='ssh chjo5232@mars.cs.qc.cuny.edu '
alias reactjs='create-react-app' #Type the project name for react to create the project
alias video='xdg-open' #Type the name of the video to play the video

# Directory traversal
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

########
# path #
########

export PATH=/home/nyjoey/anaconda3/bin:$PATH
export PATH=/home/nyjoey/android-studio/bin:$PATH
export PATH=/home/nyjoey/visual-studio-code-bin/src/VSCode-linux-x64:$PATH
