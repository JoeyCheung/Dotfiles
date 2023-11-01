# Dotfiles




https://github.com/JoeyCheung/Dotfiles/assets/30446022/62c1ea8d-ce5b-425b-be5a-379d5c853c83


![2018-09-19_144842_1920x1080](https://user-images.githubusercontent.com/30446022/45889706-1ed44180-bd8f-11e8-9a9e-07ef7399dd8b.png)

# How to install

- git clone 
- cd into folder
- Run source install.sh
- After installation run source remove.sh (This gets rid of all of the dotfiles that were created. Don't worry you'll be replacing it with the ones that I have in this repo)
- Run source symlinks.sh (This will run all the dotfiles and connect them to the system)

When running all of these, make sure that all of the dotfiles are moved into the home directory, that autoload is placed into .vim folder then run "vim +PluginInstall +qall", and that you cd into .vim/bundle/YouCompleteMe and type this command "python install.py" to fix "YCM error. The ycmd server SHUT DOWN (restart wit…the instructions in the" error or some commands might not work properly

# Issues
- Make a cron job to automatically update package manager (sudo pacman -Syu)
- Make zsh automated to become the default shell.
- Make vim the default text editor in ranger
- possible kbd folder in roots directory that handles keyboard shortcuts (This is for dvorak layout) https://wiki.archlinux.org/index.php/Linux_console/Keyboard_configuration#Keymaps
- Add keybindings in .vimrc file to run terminal commands inside of vim such as switching between qwerty and dvorak or running python code
- Also add keybindings for ranger which should be in rc.conf folder https://github.com/ranger/ranger/wiki/Keybindings

# Frequently Asked Questions

Q: Why is Wifi/Connect alias commands not working? 

A: If you are wired in through an ethernet, it will not show wifi connections. Or just use nmtui command

Q: How come vim can't read ctags?

A: You have to go to the ctags-5.8 directory and type the command sudo make install
