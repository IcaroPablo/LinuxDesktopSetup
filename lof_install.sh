echo "downloading dependencies: wmctrl and xbindkeys"
sudo pacman -Syu xbindkeys wmctrl #se for arch-based
sudo apt update && sudo apt install xbindkeys wmcrtl #se for ubuntu-based

echo "transfering .xbindkeysrc to \$HOME"
cp .xbindkeysrc $HOME

echo "downloading dmenu"
cd $HOME #baixar o dmenu no home
git clone https://git.suckless.org/dmenu
cd dmenu
sudo make clean install
cd ..
rm -rf dmenu

echo "adding lof to /usr/local/bin"
sudo cp lof /usr/local/bin
