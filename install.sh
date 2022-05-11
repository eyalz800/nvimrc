#!/bin/bash

set -e

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    sudo DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:neovim-ppa/unstable
    sudo DEBIAN_FRONTEND=noninteractive apt update
    sudo DEBIAN_FRONTEND=noninteractive apt install -y neovim
elif [[ "$OSTYPE" == "darwin"* ]]; then
    brew install nvim
else
    echo "Unsupported OS"
    exit 1
fi

cp init.vim ~/.config/nvim/init.vim
ln -f -s ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
nvim -E -s -u ~/.config/nvim/init.vim +'PlugInstall' +qa
nvim -E -s -u ~/.config/nvim/init.vim +'!python3 -m pip install --user --upgrade pynvim' +qa
