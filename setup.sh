#!/bin/sh

echo -e "\033[0;32m[.nvim]\033[0m"

# ~/.config/nvim
if [ -d ~/.config/nvim ]; then
    echo -e "\033[0;31m[.nvim] : fail (~/.config/nvim)\033[0m"
    exit 1
fi

# neovim
pacman -S --needed --noconfirm git
pacman -S --needed --noconfirm base-devel cmake unzip ninja curl
git submodule update --init
cd neovim
make CMAKE_BUILD_TYPE=Release
make install
cd ..

# lazy
pacman -S --needed --noconfirm lua51 luarocks

# telescope
pacman -S --needed --noconfirm ripgrep fd

# lsp
pacman -S --needed --noconfirm python3

# ~/.config/nvim
mkdir -p ~/.config
ln -s "$(pwd)/nvim" ~/.config/nvim

echo -e "\033[0;32m[!.nvim]\033[0m"
