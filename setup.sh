#!/bin/sh

echo -e "\033[0;32m[.nvim] : setup...\033[0m"

# ~/.config/nvim
if [ -d ~/.config/nvim ]; then
    echo -e "\033[0;31m[.nvim] : fail (-d ~/.config/nvim)\033[0m"
    exit
fi

# syu
pacman -Syu --noconfirm --needed

# git
pacman -S --noconfirm --needed git

# neovim
pacman -S --noconfirm --needed base-devel cmake unzip ninja curl
git submodule update --init
cd neovim
make CMAKE_BUILD_TYPE=Release
make install
cd ..

# lazy
pacman -S --noconfirm --needed lua51 luarocks

# telescope
pacman -S --noconfirm --needed ripgrep fd

# lsp
pacman -S --noconfirm --needed python3

# ~/.config/nvim
mkdir -p ~/.config
ln -s "$(pwd)/nvim" ~/.config/nvim

echo -e "\033[0;32m[.nvim] : success\033[0m"
