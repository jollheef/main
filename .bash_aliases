# Install pkg
alias yi='slapt-get -i'
# Search pkg
alias ys='slapt-get --search'
# Update pkgs
alias yu='slackpkg update && slackpkg upgrade-all && slackpkg install-new'
alias yus='slapt-get -u && slapt-get --upgrade'
# Remove pkg
alias yr='slapt-get --remove'
# Search installed pkg
alias yq='slapt-get --installed |grep '
# Auto clean
alias yca='slapt-get --autoclean'
# Clean
alias yc='slapt-get --clean'

alias ':q'='exit'
alias q='exit'
alias quit='exit'
alias exi='exit'

SHOWIP='ip.icanhazip.com'
alias 'show-ext-ip'='echo -n Ext IP: && links          -dump $SHOWIP'
alias 'show-tor-ip'='echo -n Tor IP: && links -socks-proxy 127.0.0.1:9050 -dump $SHOWIP'

#alias 'emacs'='emacsscript && emacsclient -t -c'

alias mc='mc -b'

# As ROOT
#alias 'rc.d'='sudo rc.d'

alias 'reboot'='sudo reboot'

alias 'slackpkg'='sudo slackpkg'
alias 'slapt-get'='sudo slapt-get'
alias 'sbopkg'='sudo sbopkg'
alias 'shutdown'='sudo shutdown -h now'
#alias 'torrestart'='rc.d restart tor'

alias 'gitucp'='gitconf update all && gitconf commit && gitconf push'

alias 'kusu'='ssh root@kusu'
