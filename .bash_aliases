# Install pkg
alias yi='sbopkg'

# Search pkg
alias ys='sbopkg -s'

# Update pkgs
alias yu='slackpkg update && slackpkg upgrade-all'
alias yub='sbopkg -u && sbopkg -c'
alias yuall='yu && yub'

# Search installed pkg
alias yq='sbopkg -p |grep  '

# Exit
alias ':q'='exit'
alias q='exit'
alias quit='exit'
alias exi='exit'

# Show IP
SHOWIP='ip.icanhazip.com'
alias 'show-ext-ip'='echo -n Ext IP: && links          -dump $SHOWIP'

# As ROOT
alias 'reboot'='sudo reboot'
alias 'slackpkg'='sudo slackpkg'
alias 'sbopkg'='sudo sbopkg'
alias 'shutdown'='sudo shutdown -h now'
alias 'installpkg'='sudo installpkg'

alias 'scilab'='scilab-adv-cli'
