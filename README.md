# Dotfiles

![2018-09-19_144842_1920x1080](https://user-images.githubusercontent.com/30446022/45889706-1ed44180-bd8f-11e8-9a9e-07ef7399dd8b.png)

# How to install

- git clone 
- cd into folder
- Run source install.sh
- After installation run source remove.sh (This gets rid of all of the dotfiles that were created. Don't worry you'll be replacing it with the ones that I have in this repo)
- Run source symlinks.sh (This will run all the dotfiles and connect them to the system)

When running all of these, make sure that all of the dotfiles are moved into the home directory, that autoload is placed into .vim folder then run "vim +PluginInstall +qall", and that you cd into .vim/bundle/YouCompleteMe and type this command "python install.py" to fix "YCM error. The ycmd server SHUT DOWN (restart wit…the instructions in the" error or some commands might not work properly

# Issues

- Make zsh automated to become the default shell.
- Command not found: prompt error after installing then running symlinks
- Make vim the default text editor in ranger

# Frequently Asked Questions

Q: Why is Wifi/Connect alias commands not working? 

A: If you are wired in through an ethernet, it will not show wifi connections.

Q: How come vim can't read ctags?

A: You have to go to the ctags-5.8 directory and type the command sudo make install
