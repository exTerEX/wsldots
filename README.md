# Dotfiles for Windows Subsystems for Linux

> **IMPORTANT!**: Dotfile repository intended for personal use. Code is available for others to use, but most settings are personalized..

The dotfiles contain configuration for many different programs, and settings used in Windows Subsystem for Linux (WSL). The `setup` script installs essential programs and links configuration files so the repository works cleanly on Ubuntu WSL.

## Setup

Run the installer from the repository root:

```bash
./setup
```

The installer now:
- creates organized directories and backups for existing dotfiles
- installs essential packages from `scripts/packages.txt`
- installs `oh-my-bash` if missing
- links Git, Bash, GPG, SSH, and wget configuration
- installs WSL-aware config via `/etc/wsl.conf` when available
- configures a global Git ignore file at `~/.config/git/.gitignore`

## Added modules

- `bash/.bashrc`
- `bash/.bash_profile`
- `bash/.bash_aliases`
- `bash/.bash_functions`
- `bash/.bash_exports`
- `bash/.inputrc`
- `git/.gitconfig`
- `gpg/gpg.conf`
- `wsl.conf`
- `.wslconfig.example`
- `setup/packages.txt`

## WSL recommendations

Use the example Windows config from `.wslconfig.example` in your Windows home directory as `~/.wslconfig`.

If you need custom mount or environment behavior, edit `wsl.conf` or use Windows Terminal profiles with WSL.

## License

This project is licensed under `Unlicense`. For more details see [LICENSE](LICENSE).
