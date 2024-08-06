#!/bin/bash

echo "Check zsh is the default shell first before running"
# see: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH


create_symlink() {
    echo "... $1"

    if [ $# -eq 2 ]
    then
        ln -s -f -F ~/.dotfiles/$1 ~/$2
    else
        ln -s -f -F ~/.dotfiles/$1 ~/$1
    fi
}

echo "Creating configuration symlinks..."

# neovim
mkdir -p $HOME/.config/nvim
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/init.vim

# zsh
create_symlink .zshrc
create_symlink .zprofile

#git
create_synlink .gitconfig

# vscode
ln -sf $(pwd)/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -sf $(pwd)/vscode/settings.json /Users/daniel.clayton/Library/Application\ Support/Code/User/settings.json



