#!/bin/sh

create_symlinks() {
    ln -shf ~/.dotfiles/.config/bat/ ~/.config/
    ln -shf ~/.dotfiles/.config/nvim/ ~/.config/
    ln -shf ~/.dotfiles/.config/spaceship-prompt/ ~/.config/
} 

create_symlinks
