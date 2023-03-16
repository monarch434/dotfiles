#!/bin/sh

create_symlinks() {
    ln -sf ${PWD}/.config/starship.toml ~/.config/
    ln -sf ${PWD}/.config/bat/ ~/.config/
    ln -sf ${PWD}/.config/nvim/ ~/.config/
} 

create_symlinks
