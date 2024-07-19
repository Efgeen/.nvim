#!/bin/sh

# assert
if [ -d ~/.config/nvim ]; then
    echo "[.nvim] : fail (~/.config/nvim)"
    exit 1
fi

# neovim
pacman -S --needed --noconfirm git
pacman -S --needed --noconfirm base-devel cmake unzip ninja curl
git submodule update --init
cd neovim
make CMAKE_BUILD_TYPE=Release
make install

# lazy
pacman -S --needed --noconfirm lua51 luarocks

# telescope
pacman -S --needed --noconfirm ripgrep fd

# lsp
pacman -S --needed --noconfirm python3

# ~/.config/nvim
mkdir -p ~/.config
ln -s "$(pwd)/nvim" ~/.config/nvim

echo "[.nvim] : success"

