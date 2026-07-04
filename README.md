# Dan's dotfiles
(at least hopefully the ones I need)

`install.sh` installs dependencies in an idempotent manner, including homebrew.

`link-dotfiles.sh` sets up the symlinks for the dotfiles.

```
git clone --recursive  https://github.com/danclaytondev/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
# wait a while...
./link-dotfiles.sh
```

Credit to [Dave](https://github.com/davidmeredith/dotfiles) and [Dries Vints](https://github.com/driesvints/dotfiles) for some of the inspiration for this setup.
