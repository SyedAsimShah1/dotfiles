#!/bin/bash

# Install dep
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install zsh tmux make gcc ripgrep unzip git xclip neovim tree bat -y

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
# Link tmux config
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf 

# Link zsh config
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# Link nvim config
ln -s ~/dotfiles/nvim ~/.config/nvim

# set zsh as default shell
chsh -s $(which zsh)

# if not on WSL, link the wezterm config
# echo "ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua"
