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

echo "\nSetting up node (fnm)"
# fnm should be installed by brew

if ! command -v node > /dev/null 2>&1; then
  echo "\nInstalling Node LTS"
  eval "$(fnm env)"
  fnm install --lts
  export PATH=/home/$USER/.fnm:$PATH
  eval "$(fnm env)"
fi

if ! command -v pnpm > /dev/null 2>&1; then
  echo "\nInstalling pnpm"
  # corepack pnpm broken at the minute, need to pin to 10.0.0
  # https://github.com/nodejs/corepack/issues/612
  corepack prepare pnpm@10.0.0 --activate
  corepack use pnpm
fi

echo "\nAll done! Hope that worked. :)"
