#!/bin/sh

if ! command -v git; then
    echo "[fail] : git"
    exit 1
fi

if [ -d ~/.config/nvim ]; then
    echo "[fail] : ~/.config/nvim"
    exit 2
fi

sudo pacman -S base-devel cmake unzip ninja curl

git submodule update --init

cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install

mkdir -p ~/.config

ln -s "$(pwd)/.config/nvim" ~/.config/nvim

echo "[success]"
