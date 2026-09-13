#!/bin/zsh
set -e

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "\nInstalling ohmyzsh\n"
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Brew
if ! command -v brew > /dev/null 2>&1; then
  echo "\nInstalling Brew"
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Always load brew into *this* shell, whether we just installed it or not
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

brew analytics off

echo "\nUpdating Brew"
brew update
brew upgrade

echo "\nInstalling Brewfile"
brew bundle install --file "${0:a:h}/Brewfile"

echo "\nSetting up node (fnm)"
# fnm installed by brew; load it into *this* shell
eval "$(fnm env --use-on-cd)"

if ! command -v node > /dev/null 2>&1; then
  echo "\nInstalling Node LTS"
  fnm install --lts
  fnm use lts-latest
  eval "$(fnm env --use-on-cd)"
fi

echo "\nInstalled packages :)"
