#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

DOTFILES=$(cd -P -- "$(dirname -- "$0")" && cd .. && pwd -P)
PWSH_PATH=/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe
WINDOWS_PATH=""

if [ -x "$PWSH_PATH" ]; then
    WINDOWS_USER=$("$PWSH_PATH" -NoProfile -Command '$env:UserName' | tr -d '\r')
    WINDOWS_PATH="/mnt/c/Users/$WINDOWS_USER"
fi

backup_dir="$HOME/.dotfiles_backup/$(date +%Y%m%d%H%M%S)"

ensure_dir() {
    mkdir -p "$1"
}

backup_path() {
    local target="$1"
    if [ -e "$target" ] || [ -L "$target" ]; then
        ensure_dir "$backup_dir"
        mv -T "$target" "$backup_dir/$(basename "$target")"
        echo "Backed up $target -> $backup_dir/$(basename "$target")"
    fi
}

install_link() {
    local source="$1"
    local target="$2"
    ensure_dir "$(dirname "$target")"
    backup_path "$target"
    ln -sf "$source" "$target"
    echo "Linked $target -> $source"
}

install_file() {
    local source="$1"
    local target="$2"
    ensure_dir "$(dirname "$target")"
    backup_path "$target"
    cp -a "$source" "$target"
    echo "Copied $source -> $target"
}

is_wsl() {
    [ -r /proc/sys/kernel/osrelease ] && grep -qi microsoft /proc/sys/kernel/osrelease
}

echo "Dotfiles path: $DOTFILES"
if [ -n "$WINDOWS_PATH" ]; then
    echo "Windows home path: $WINDOWS_PATH"
else
    echo "PowerShell not detected; Windows path integration disabled"
fi

ensure_dir "$HOME/.config/git"
ensure_dir "$HOME/.config/bash"
ensure_dir "$HOME/.gpg"
ensure_dir "$HOME/.ssh"
ensure_dir "$HOME/.gnupg"

install_link "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

for file in .gitignore .gitattributes .gitmessage; do
    install_link "$DOTFILES/git/$file" "$HOME/.config/git/$file"
done

if [ -n "$WINDOWS_PATH" ] && [ -e "$WINDOWS_PATH/.ssh/known_hosts" ]; then
    install_link "$WINDOWS_PATH/.ssh/known_hosts" "$HOME/.ssh/known_hosts"
fi

if [ -n "$WINDOWS_PATH" ] && [ -e "$WINDOWS_PATH/.ssh/config" ]; then
    install_file "$WINDOWS_PATH/.ssh/config" "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
fi

for keyfile in private_keys.gpg public_keys.gpg; do
    if [ -n "$WINDOWS_PATH" ] && [ -e "$WINDOWS_PATH/.gpg/$keyfile" ]; then
        install_file "$WINDOWS_PATH/.gpg/$keyfile" "$HOME/.gpg/$keyfile"
        chmod 600 "$HOME/.gpg/$keyfile"
    fi
done

for keyfile in "$HOME/.gpg"/*.gpg; do
    if [ -f "$keyfile" ]; then
        gpg --import "$keyfile" || true
    fi
done

install_link "$DOTFILES/gpg/gpg-agent.conf" "$HOME/.gnupg/gpg-agent.conf"
install_link "$DOTFILES/gpg/gpg.conf" "$HOME/.gnupg/gpg.conf"
chmod 700 "$HOME/.gnupg"
chmod 600 "$HOME/.gnupg/gpg-agent.conf" "$HOME/.gnupg/gpg.conf"

install_link "$DOTFILES/wget/.wgetrc" "$HOME/.wgetrc"

install_link "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
install_link "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"
install_link "$DOTFILES/.profile" "$HOME/.profile"
install_link "$DOTFILES/bash/.inputrc" "$HOME/.inputrc"

for file in .bash_aliases .bash_functions .bash_exports; do
    install_link "$DOTFILES/bash/$file" "$HOME/.config/bash/$file"
done

if command -v apt-get >/dev/null 2>&1; then
    echo "Installing APT packages from scripts/packages.txt"
    sudo apt-get update
    xargs -r sudo apt-get install -y < <(grep -E -v '^\s*(#|$)' "$DOTFILES/scripts/packages.txt")
    if command -v locale >/dev/null 2>&1 && ! locale -a 2>/dev/null | grep -iq '^en_US\.utf-8$'; then
        sudo locale-gen en_US.UTF-8
    fi
fi

if [ ! -d "$HOME/.oh-my-bash" ]; then
    if command -v curl >/dev/null 2>&1; then
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" "" --unattended
    fi
fi

if command -v curl >/dev/null 2>&1; then
    mkdir -p "$HOME/.local/bin"
    curl -LsSf https://astral.sh/uv/install.sh | env UV_INSTALL_DIR="$HOME/.local/bin" sh
fi

if is_wsl && command -v sudo >/dev/null 2>&1; then
    echo "Installing WSL configuration to /etc/wsl.conf"
    sudo cp -f "$DOTFILES/wsl.conf" /etc/wsl.conf
fi

echo "Dotfiles install complete."
echo "If you changed shell configuration, start a new session or run: source ~/.bashrc"
