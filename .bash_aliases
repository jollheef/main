# Install pkg
alias yi='yaourt -S'
# Search pkg
alias ys='yaourt -Ss'
# Update pkgs
alias yu='yaourt -Syua'
# Update pkgs without confirmation
alias yun='yaourt -Syua --noconfirm'
# Remove pkg
alias yr='yaourt -Rs'
# Search installed pkg
alias yq='yaourt -Qs'
# Clean
alias yc='yaourt -Sc --noconfirm'

alias ':q'='exit'
alias q='exit'
alias quit='exit'
alias exi='exit'

SHOWIP='ip.icanhazip.com'
alias 'show-ext-ip'='echo -n Ext IP: && links          -dump $SHOWIP'
alias 'show-tor-ip'='echo -n Tor IP: && links -socks-proxy 127.0.0.1:9050 -dump $SHOWIP'

alias 'emacs'='emacsscript && emacsclient -t -c'

# As ROOT
alias 'rc.d'='sudo rc.d'

alias 'reboot'='sudo reboot'
alias 'shutdown'='sudo shutdown'
alias 'torrestart'='rc.d restart tor'

alias 'gitucp'='gitconf update all && gitconf commit && gitconf push'
