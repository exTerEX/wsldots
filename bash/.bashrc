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

# SSH configuration
export SSH_KEY_PATH="$HOME/.ssh/"

# GPG configuration
export GPG_KEY_PATH="$HOME/.gpg/"
export GPG_TTY=$(tty)  # Required for GPG signing in git

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

# Nvidia CUDA toolkit 12.6
export PATH=/usr/local/cuda-12.6/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.6/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
. "$HOME/.cargo/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/exterex/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/exterex/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/exterex/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/exterex/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --- Antigravity / Chrome Bridge Setup ---
# 1. Get Windows Gateway IP dynamically
WIN_IP=$(ip route show | grep -i default | awk '{ print $3}')

# 2. Start socat in background if not already running
if ! pgrep -f "socat TCP-LISTEN:9222" > /dev/null; then
    socat TCP-LISTEN:9222,fork,reuseaddr TCP:$WIN_IP:9222 &> /dev/null &
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
