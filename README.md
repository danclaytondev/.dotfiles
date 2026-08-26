# Dan's dotfiles
(at least hopefully the ones I need)

`install.sh` installs dependencies in an idempotent manner, including homebrew.

`link-dotfiles.sh` sets up the symlinks for the dotfiles.

Git identity is not tracked - `link-dotfiles.sh` creates an empty
`~/.gitconfig.local` to fill in, so the same `.gitconfig` works on the work and
personal machines.

`macos.sh` applies the handful of macOS system settings I care about, mainly
remapping caps lock to escape.

```
git clone --recursive  https://github.com/danclaytondev/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
# wait a while...
./link-dotfiles.sh
./macos.sh
```

Credit to [Dave](https://github.com/davidmeredith/dotfiles) and [Dries Vints](https://github.com/driesvints/dotfiles) for some of the inspiration for this setup.
