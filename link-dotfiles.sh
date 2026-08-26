#!/bin/zsh

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
create_symlink .config/nvim/init.vim

# ghostty
mkdir -p $HOME/.config/ghostty
create_symlink .config/ghostty/config

# zsh
create_symlink .zshrc
create_symlink .zprofile

#git
create_symlink .gitconfig

# zed
mkdir -p $HOME/.config/zed
create_symlink .config/zed/settings.json
create_symlink .config/zed/keymap.json

# Git identity is per-machine, so it is not tracked. Leave an existing one alone.
if [ ! -f "$HOME/.gitconfig.local" ]; then
    echo "\nCreating ~/.gitconfig.local - fill in your name and email"
    cat > "$HOME/.gitconfig.local" <<'EOF'
[user]
	name =
	email =
EOF
fi
