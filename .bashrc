#
# ~/.bashrc
#

export PS1='\[\
\e[1;33;49m\]\
(\
\[\e[1;32;49m\]\
\u\
\[\e[1;34;49m\]\
@\
\[\e[1;35;49m\]\
\h\
\[\e[1;33;49m\]\
)\
\[\e[1;36;49m\]\
\w\
\[\e[1;33;49m\]\
 \$\
\[\e[0m\]\
 '

PATH=$PATH:~/bin:/sbin:/usr/sbin

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export TERM=xterm-256color

export EDITOR="/usr/bin/jed"
#export VIEWER=less
