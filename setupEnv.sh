#!/bin/bash

# Install dep
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install zsh tmux make gcc ripgrep unzip git xclip neovim tree -y

# Link tmux config
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf 

# Link zsh config
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# set zsh as default shell
chsh -s $(which zsh)

# Link wezterm config
echo "Manual action required for configuring Wezterm"
echo "If on WSL, run the following command in PowerShell in admin:"
echo "New-Item -ItemType SymbolicLink -Path "C:\Users\Asim\.wezterm.lua" -Target "\\wsl$\Ubuntu\home\asim\dotfiles\wezterm\wezterm.lua""
echo "else, run the following "
echo "ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua"

# Manual installs
echo "Build the following from source: fzf"
