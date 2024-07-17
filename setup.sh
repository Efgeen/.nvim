#!/bin/sh

if [ -d ~/.config/nvim ]; then
    echo "[fail] : ~/.config/nvim"
    exit 1
fi

pacman -S --needed --noconfirm base-devel cmake unzip ninja curl

pacman -S --needed --noconfirm git

git submodule update --init

cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install # todo: rm sudo?

# lazy
pacman -S --noconfirm luarocks

# telescope
pacman -S --noconfirm ripgrep fd

# lsp
pacman -S --noconfirm python3

# ~/.config/nvim
mkdir -p ~/.config
ln -s "$(pwd)/.config/nvim" ~/.config/nvim

echo "[success]"

