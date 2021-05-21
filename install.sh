#!/bin/bash

set -e

sudo DEBIAN_FRONTEND=noninteractive add-apt-repository -y ppa:neovim-ppa/stable
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y neovim

cp init.vim ~/.config/nvim/init.vim
nvim -E -s -u ~/.config/nvim/init.vim +'!python3 -m pip install --user --upgrade pynvim' +qa
