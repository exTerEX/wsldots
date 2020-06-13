# ~/.bashrc: executed by bash(1) for non-login shells.

shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s nocaseglob
shopt -s cdspell

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

for file in ~/.config/.{exports,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt