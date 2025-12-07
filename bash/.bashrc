# Path to your oh-my-bash installation.
export OSH=$HOME/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="axin"

# Auto update settings
export UPDATE_OSH_DAYS=30
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $OSH/custom?
OSH_CUSTOM=$HOME/.custom

# Enabled completions
completions=(docker docker-compose git makefile pip ssh)

# Enabled aliases
aliases=(general)

# Enabled plugins
plugins=(git)

# Source oh-my-bash
if [[ -f $OSH/oh-my-bash.sh ]]; then
    source $OSH/oh-my-bash.sh
fi

# Add user bin directories to PATH
for bin_dir in "$HOME/bin" "$HOME/.local/bin"; do
    if [[ -d "$bin_dir" ]] && [[ ":$PATH:" != *":$bin_dir:"* ]]; then
        PATH="$bin_dir:$PATH"
    fi
done

# UV shell completion
eval "$(uv generate-shell-completion bash)"
eval "$(uvx --generate-shell-completion bash)"
