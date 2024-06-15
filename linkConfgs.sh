#!/bin/bash

# Link tmux config
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf 

# Link zsh config
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

# Link wezterm config
echo "Manual action required for configuring Wezterm"
echo "If on WSL, run the following command in PowerShell in admin:"
echo "New-Item -ItemType SymbolicLink -Path "C:\Users\Asim\.wezterm.lua" -Target "\\wsl$\Ubuntu\home\asim\dotfiles\wezterm\wezterm.lua""
echo "else, run the following "
echo "ln -s ~/dotfiles/wezterm/wezterm.lua ~/.wezterm.lua"
