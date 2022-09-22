#!/bin/sh

create_symlinks() {
    ln -shf ~/.dotfiles/.config/bat/ ~/.config/
    ln -shf ~/.dotfiles/.config/nvim/ ~/.config/
    ln -shf ~/.dotfiles/.config/iterm2/ ~/.config/
    ln -shf ~/.dotfiles/.config/simple-update-notifier/ ~/.config/
    ln -shf ~/.dotfiles/.config/spaceship-prompt/ ~/.config/
} 

create_symlinks
