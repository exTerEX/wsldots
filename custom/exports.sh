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
