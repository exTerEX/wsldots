# WSL dotfiles

My personal collection of .dotfiles tailed for Debian based
distributions running WSL. It installs oh-my-bash for aliases,
terminal themes, etc. and automatically connect .ssh, .gpg
and .gitconfig configurations from Windows with Linux if
running under WSL.

## Usage

```sh
$ cd ~
$ git clone https://github.com/exTerEX/.dotfiles.git
$ bash .dotfiles/setup
```

Step 1 is optional, but storing dotfiles in $HOME is my preferential place of storage.

## License

This project is licensed under `Unlicense`. For more details see [LICENSE](LICENSE).
