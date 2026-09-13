# Dan's dotfiles

`install.sh` installs dependencies in an idempotent manner, including homebrew.

`link-dotfiles.sh` sets up the symlinks for the dotfiles, and also bootstraps
the neovim plugins (vim-plug) now that `init.vim` is linked.

Git identity is not tracked - `link-dotfiles.sh` creates an empty
`~/.gitconfig.local` to fill in, so the same `.gitconfig` works on the work and
personal machines.

`macos.sh` applies the handful of macOS system settings, including remapping caps lock to escape so I can actually use vim.

`setup.sh` runs all three of the above in order.

```
xcode-select --install
# wait for it to finish, then:
git clone --recursive  https://github.com/danclaytondev/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

Credit to [Dave](https://github.com/davidmeredith/dotfiles) and [Dries Vints](https://github.com/driesvints/dotfiles) for some of the inspiration for this setup.
