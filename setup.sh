#!/bin/sh

# assert
if [ -d ~/.config/nvim ]; then
    echo "[fail] : ~/.config/nvim"
    exit 1
fi

# neovim
pacman -S --needed --noconfirm base-devel cmake unzip ninja curl
pacman -S --needed --noconfirm git
git submodule update --init
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install # todo: rm sudo?

# lazy
pacman -S --needed --noconfirm lua51 luarocks

# telescope
pacman -S --needed --noconfirm ripgrep fd

# lsp
pacman -S --needed --noconfirm python3

# ~/.config/nvim
mkdir -p ~/.config
ln -s "$(pwd)/.config/nvim" ~/.config/nvim

echo "[success]"

