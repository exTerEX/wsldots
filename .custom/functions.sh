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
