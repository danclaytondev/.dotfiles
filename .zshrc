DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
ZSH_DISABLE_COMPFIX="true"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


ZSH_THEME="robbyrussell"

plugins=(git z)

# Extra completion functions must be on fpath BEFORE oh-my-zsh runs compinit,
# so omz's single compinit picks them up (avoids a second, redundant compinit).
fpath+=~/.zfunc

# oh-my-zsh runs compinit on every shell, rescanning all of fpath. Intercept
# its call and add -C (trust the existing dump) when the dump was built today.
# omz deletes the dump itself when fpath/version change, forcing a rebuild.
compinit() {
  unfunction compinit
  autoload -Uz compinit
  if [[ "$(date +'%j')" == "$(stat -f '%Sm' -t '%j' "$ZSH_COMPDUMP" 2>/dev/null)" ]]; then
    compinit -C "$@"
  else
    compinit "$@"
    # compinit leaves a still-valid dump untouched; bump mtime so the
    # -C fast path is taken for the rest of the day
    command touch "$ZSH_COMPDUMP"
  fi
}

source $ZSH/oh-my-zsh.sh

# fnm https://github.com/Schniz/fnm
# manages node 
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"


alias escalate="/Applications/Privileges.app/Contents/Resources/PrivilegesCLI --add"
alias deescalate="/Applications/Privileges.app/Contents/Resources/PrivilegesCLI --remove"

alias ls="eza --icons --git"
alias vim="nvim"
alias gs="git status"
alias gc="git commit"
alias gd="git diff"
alias gds="git diff --staged"

export PATH="/Users/daniel.clayton/.local/bin:$PATH"

loadenv() {
  set -o allexport
  source .env
  set +o allexport
}

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




zstyle ':completion:*' menu select

# For kubectl krew plugins
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

ff() {
  aerospace list-windows --all | fzf --bind 'enter:execute(bash -c "aerospace focus --window-id {1}")+abort'
}
