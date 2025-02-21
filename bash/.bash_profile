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
