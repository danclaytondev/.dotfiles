# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z)

source $ZSH/oh-my-zsh.sh


alias escalate="/Applications/Privileges.app/Contents/Resources/PrivilegesCLI --add"
alias deescalate="/Applications/Privileges.app/Contents/Resources/PrivilegesCLI --remove"

alias ls="eza --icons --git"
alias vim="nvim"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"

export PATH="/Users/daniel.clayton/.local/bin:$PATH"

woosh() {
  git checkout -b $1 && git push -u origin HEAD
}

brew-add() {
 local brewfile=~/.dotfiles/Brewfile
 local type="brew"
 
 touch $brewfile

 if [ "$1" = "--cask" ]; then
   type="cask"
   shift
 fi
 
 if ! grep -q "^${type} \"$1\"" $brewfile; then
   echo "${type} \"$1\"" >> $brewfile
   echo "adding to Brewfile: ${type} \"$1\""
   brew bundle install --file $brewfile
 fi
}

