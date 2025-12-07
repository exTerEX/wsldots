if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# Load separate configuration files
for file in ~/.config/bash/.bash_{aliases,functions,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Bash history settings
shopt -s histappend;  # Append to history file instead of overwriting
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL="ignoreboth";  # Ignore duplicates and commands starting with space

# Bash behavior improvements
shopt -s cdspell;      # Autocorrect typos in path names when using 'cd'
shopt -s nocaseglob;   # Case-insensitive globbing

# Locale settings
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# SSH configuration
export SSH_KEY_PATH="$HOME/.ssh/"

# GPG configuration
export GPG_KEY_PATH="$HOME/.gpg/"
export GPG_TTY=$(tty)  # Required for GPG signing in git

# WSL2 DISPLAY variable for X server
if [[ -f /etc/resolv.conf ]]; then
    export DISPLAY="$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0"
fi

# Utility aliases
alias reload="exec ${SHELL} -l"  # Reload the shell as a login shell
