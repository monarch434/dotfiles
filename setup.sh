#!/bin/sh

create_symlinks() {
    ln -s ${PWD}/.config/starship.toml ~/.config/
    ln -s ${PWD}/.config/bat/ ~/.config/
    ln -s ${PWD}/.config/nvim/ ~/.config/
    ln -s ${PWD}/.config/tmux/ ~/.config/
    ln -s ${PWD}/home/wezterm.lua ~/.wezterm.lua
} 

create_symlinks
