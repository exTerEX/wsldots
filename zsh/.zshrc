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
plugins=(
    autopep8
    cp
    gh
    git
    git-auto-fetch
    git-extras
    pip
    pipenv
    python
    ubuntu
)

source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
else
    export EDITOR='mvim'
fi

# VCPKG
export VCPKG_FEATURE_FLAGS=manifests,$VCPKG_FEATURE_FLAGS
export VCPKG_ROOT=$HOME/lib/vcpkg

# Git signing
export GPG_TTY=$(tty)
