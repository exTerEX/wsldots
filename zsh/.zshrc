# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/exterex/.oh-my-zsh"

# Include definition files
for FILE in .{exports,aliases,functions}; do
    [ -r "$FILE" ] && [ -f "$FILE" ] && source "$FILE"
done
unset FILE

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

# Git
export GPG_TTY=$(tty)

# vcpkg
export VCPKG_FEATURE_FLAGS=manifests,$VCPKG_FEATURE_FLAGS
export VCPKG_ROOT=/usr/local/lib/vcpkg

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR="vim"
else
    export EDITOR="code"
fi

alias python="python3"

mkd () {
    mkdir -p -- $* ; cd -- $* || exit ;
}

update () {
    if command -v apt > /dev/null 2>&1; then
        sudo apt update && sudo apt upgrade -y
    fi
}

upgrade () {
    if command -v apt > /dev/null 2>&1; then
        sudo apt update && sudo apt full-upgrade -y 
    fi

    if command -v upgrade_oh_my_bash > /dev/null 2>&1; then
        upgrade_oh_my_bash
    fi
}

gitc () {
    git clone $*

    cd `echo $* | sed -n -e 's/^.*\/\([^.]*\)\(.git\)*/\1/p'`
}

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
