#!/bin/sh

create_symlinks() {
    ln -s ${PWD}/.config/starship.toml ~/.config
    ln -s ${PWD}/.config/bat/ ~/.config
    ln -s ${PWD}/.config/nvim/ ~/.config
    ln -s ${PWD}/.config/tmux/ ~/.config
    ln -s ${PWD}/.config/wezterm ~/.config
    ln -s ${PWD}/home/.zshrc ~/.zshrc
    ln -s ${PWD}/home/.gitmux.conf ~/.gitmux.conf
    ln -s ${PWD}/.config/aerospace/ ~/.config
    ln -s ${PWD}/.config/ghostty/ ~/.config
}

create_symlinks
