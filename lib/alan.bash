#!/usr/bin/env bash

if [[ -e $(cd -P -- "$(dirname -- "$0")" && pwd -P)/lib/alan/alan ]]; then
    sudo ln -s $(cd -P -- "$(dirname -- "$0")" && pwd -P)/lib/alan/alan /usr/local/bin
fi
