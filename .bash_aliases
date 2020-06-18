alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias la='ls -laF --color'
alias dir='dir --color=auto'
alias ls='ls --color'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gurl='curl --compressed'
alias ourl='curl --compressed -O'
alias week='date +%V'
alias timer='echo "Timer. Stop with Ctrl-D." && date && time cat && date'
alias update='sudo apt -y update; sudo apt -y full-upgrade; sudo apt autoremove -y;'
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias whois='whois -h whois-servers.net'
alias python="python3"
alias pip="python3 -m pip"
alias py="python3 -m"