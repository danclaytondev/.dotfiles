#!/bin/zsh

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "\nInstalling ohmyzsh\n"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


if [[ "$(xcode-select -p)" == "" ]]; then
  echo "\nInstalling Xcode"
  xcode-select --install
fi

# Brew
if ! command -v brew > /dev/null 2>&1; then
  echo "\nInstalling Brew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew analytics off
fi

echo "\nUpdating Brew"
#brew update
#brew upgrade

echo "\nInstalling Brewfile"
brew bundle install --file Brewfile

echo "\nNeovim setup"
# vim-plug
if [ ! -e ~/.config/nvim/autoload/plug.vim ]; then
  printf "\nInstalling vim-plug"
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

nvim --headless +PlugInstall +PlugUpgrade +PlugUpdate +PlugClean! +UpdateRemotePlugins +qall
