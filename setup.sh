#!/bin/zsh
set -e

cd "${0:a:h}"

./install.sh
./link-dotfiles.sh
./macos.sh
