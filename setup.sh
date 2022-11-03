#!/bin/sh

create_symlinks() {
    ln -sf ~/.dotfiles/.config/bat/ ~/.config/
    ln -sf ~/.dotfiles/.config/nvim/ ~/.config/
    ln -sf ~/.dotfiles/.config/spaceship-prompt/ ~/.config/
} 

create_symlinks
