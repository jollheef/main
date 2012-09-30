#
# ~/.bashrc
#

PATH=$PATH:~/bin:/sbin:/usr/sbin

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export TERM=xterm-256color
#export EDITOR=/usr/bin/emacs
#export VIEWER=less
