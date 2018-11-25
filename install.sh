#Files that use wget might have to be done manually because of updates

#changing permisions
cd $HOME
cd ../..
chmod 777 usr
cd usr
chmod 777 bin
cd $HOME

#install anaconda
wget http://repo.continuum.io/archive/Anaconda3-5.0.0-Linux-x86_64.sh
bash Anaconda3-5.0.0-Linux-x86_64.sh

#install godot
wget https://downloads.tuxfamily.org/godotengine/3.0.6/Godot_v3.0.6-stable_x11.64.zip
unzip Godot_v3.0.6-stable_x11.64.zip
chmod 777 Godot_v3.0.6-stable_x11.64
mv Godot_v3.0.6-stable_x11.64 /usr/bin
sudo rm -rf Godot_v3.0.6-stable_x11.64.zip

#install visual studio code
$HOME
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg
tar -xvf visual-studio-code-bin-1.27.2-1-x86_64.pkg.tar.xz
cd src/VSCode-linux-x64
chmod 777 code
mv code vscode

#install android studio (finish this one)
wget https://dl.google.com/dl/android/studio/ide-zips/3.2.0.26/android-studio-ide-181.5014246-linux.zip
unzip android-studio-ide-181.5014246-linux.zip
cd android-studio/bin
chmod 777 studio.sh
mv studio.sh android-studio
cd ../..
rm -rf android-studio-ide-181.5014246-linux.zip
mv android-studio $HOME

#install polybar
$HOME
git clone --branch 3.2 --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake ..
sudo make install

#install eclipse
sudo pacman -S eclipse-java

#install pycharm
sudo pacman -S pycharm-community-edition

#install tty-clock
$HOME
git clone https://aur.archlinux.org/tty-clock.git
cd tty-clock
makepkg
tar -xvf tty-clock-2.3-1-x86_64.pkg.tar.xz
cd src/tty-clock-2.3
sudo make install

#install apache spark 
$HOME
apache.claz.org/spark/spark-2.3.2/spark-2.3.2-bin-hadoop2.7.tgz
tar -xvf spark-2.3.2-bin-hadoop2.7.tgz
rm -rf spark-2.3.2-bin-hadoop2.7.tgz
mv spark-2.3.2-bin-hadoop2.7 $HOME

#install electron
$HOME
sudo pacman -S nodejs
sudo pacman -S npm
git clone https://github.com/electron/electron-api-demos
cd electron-api-demos
npm install
npm start

#install geckodriver
sudo pacman -S geckodriver

#install cava (might have messed this one up can't remember exactly how but shouldn't be too difficult to do again)
sudo pacman -S base-devel fftw ncurses alsa-lib iniparser pulseaudio

#install neofetch
sudo pacman -S neofetch

#install ranger
sudo pacman -S ranger

#install i3-gaps
sudo pacman -S i3-gaps

#install qutebrowser
sudo pacman -S qutebrowser

#install rofi
sudo pacman -S rofi

#install vim
sudo pacman -S vim

#install prezto
$HOME
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

#install rxvt-unicode
sudo pacman -S rxvt-unicode

#install w3m
sudo pacman -S w3m

#install surfraw
sudo pacman -S surfraw

#install numlockx
sudo pacman -S numlockx

#install scrot
sudo pacman -S scrot

#install compton
sudo pacman -S compton

#install feh
sudo pacman -S feh

#install python modules
pip install scrapy
pip install tensorflow
pip install discord
pip install selenium
pip install gym
pip install numpy
pip install pandas
pip install scikit-learn
