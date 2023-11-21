# Dan's dotfiles
(at least hopefully the ones I need)

`install.sh` sets up the symlinks for the dotfiles, including for vscode which is the awkward one.

I haven't included a brew file, I can install things as I need them to avoid bloat, or maybe even try using [pkgx](https://pkgx.sh/).

```
git clone --recursive  https://github.com/danclaytondev/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Credit to [Dave](https://github.com/davidmeredith/dotfiles) and [Dries Vints](https://github.com/driesvints/dotfiles) for some of the inspiration for this setup.
