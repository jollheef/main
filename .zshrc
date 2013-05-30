if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] \
    &&  ! [[ -e /tmp/.X11-unix/X0 ]] && (( EUID )); then
    while true; do
	echo -n 'Set brightness (0-255): '
	read 
	/home/michael/bin/brightness set $REPLY
	if [ $? -eq 0 ]; then
	    break
	fi
    done
    while true; do
	echo -n 'Do you want to start X? (y/n/u/e/x): '
	read
	case $REPLY in
	    [Yy]) exec startx ;;
	    [Uu]) exec startx ~/.xinitrc-univer ;;
	    [Ee]) exec startx ~/.xinitrc-escapism ;;
	    [Xx]) exec startxfce4 ;;
	    [Nn]) break ;;
	    *) printf '%s\n' 'Please answer y[es]/n[o]/u[niver]/e[scapism]/x[fce4].' ;;
	esac
    done
fi

. $HOME/.ext_aliases.zsh
. $HOME/.aliases.zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="lambda-me"

# example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/home/michael/bin:/usr/sbin:/sbin:/usr/share/openstego:/home/michael/bin:/usr/sbin:/sbin:/usr/share/openstego

export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ $TERM != screen* ]] && [[ $TERM != dumb ]] && exec tmux -2
