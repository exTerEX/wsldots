# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/exterex/.oh-my-zsh"

# Theme
ZSH_THEME="ys"

# Update settings
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 30

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Command execution time stamp format
HIST_STAMPS="dd/mm/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=()

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="code"
else
    export EDITOR="mvim"
fi

# VCPKG
export VCPKG_FEATURE_FLAGS=manifests,$VCPKG_FEATURE_FLAGS
export VCPKG_ROOT=/usr/local/lib/vcpkg

# Git signing
export GPG_TTY=$(tty)

# Alias
alias python="python3"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/lib/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/lib/conda/etc/profile.d/conda.sh" ]; then
        . "/usr/local/lib/conda/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/lib/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

