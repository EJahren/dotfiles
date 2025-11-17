set -e
sudo apt install curl python3-pip python3-dev libfuse-dev ripgrep kitty xscreensaver gmrun feh suckless-tools libghc-xmonad-contrib-dev libghc-xmonad-dev xmobar xmonad clang xclip
pip install black isort pynvim pyright

curl -L https://github.com/neovim/neovim/releases/download/v0.11.5/nvim.appimage --output nvim.appimage
sudo mv nvim.appimage /usr/bin/
sudo chmod +x /usr/bin/nvim.appimage

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim.appimage 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim.appimage 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim.appimage 60
sudo update-alternatives --config editor
sudo update-alternatives --config x-terminal-emulator
