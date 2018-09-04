log_file=~/install_progress_log.txt

####################
# Download zsh and set as the default shell and add prezto
####################

sudo pacman -S zsh
if type -p zsh > /dev/null; then
    echo "zsh Installed" >> $log_file
else
    echo "zsh FAILED TO INSTALL!!!" >> $log_file
fi
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

####################
# Give the user a summary of what has been installed
###################

echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -Joey"
rm $log_file
