mkd () {
    mkdir -p -- "$*" ; cd -- "$*" || exit ;
}

update () {
    sudo apt update && sudo apt upgrade -y
}

upgrade () {
    sudo apt update && sudo apt full-upgrade -y && upgrade_oh_my_bash
}

