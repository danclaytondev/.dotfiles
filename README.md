# Dan's dotfiles
(at least hopefully the ones I need)

`install.sh` installs dependencies in an idempotent manner, including homebrew.

`link-dotfiles.sh` sets up the symlinks for the dotfiles, including for vscode which is the awkward one.

This assumes zsh and oh-my-zsh are already up and running.

I haven't included a brew file, I can install things as I need them to avoid bloat, or maybe even try using [pkgx](https://pkgx.sh/).

```
git clone --recursive  https://github.com/danclaytondev/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
# wait a while...
./link-dotfiles.sh
```

Credit to [Dave](https://github.com/davidmeredith/dotfiles) and [Dries Vints](https://github.com/driesvints/dotfiles) for some of the inspiration for this setup.
