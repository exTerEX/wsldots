if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# Load seperate files
for file in ~/.config/bash/.bash_{aliases,functions,exports}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Append to the Bash history file
shopt -s histappend;

# Autocorrect typos in path names when using 'cd'
shopt -s cdspell;

# Case-insensitive globbing
shopt -s nocaseglob;

# Increase Bash history size. Allow 32e3 entries.
export HISTSIZE="32768";
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL="ignoreboth";

# Prefer US English and use UTF-8.
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# SSH
export SSH_KEY_PATH="$HOME/.ssh/"

# GPG
export GPG_KEY_PATH="$HOME/.gpg/"

# Fixing a problem with git signing
export GPG_TTY=$(tty)

# DISPLAY environment variable
export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
