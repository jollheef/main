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
alias 'show-tor-ip'='echo -n Tor IP: && links -socks-proxy 127.0.0.1:9050 -dump $SHOWIP'

alias 'nmcli'='ck-launch-session nmcli'

# As ROOT
alias 'reboot'='sudo reboot'
alias 'slackpkg'='sudo slackpkg'
alias 'sbopkg'='sudo sbopkg'
alias 'shutdown'='sudo shutdown -h now'
alias 'installpkg'='sudo installpkg'
alias 'removepkg'='sudo removepkg'

alias 'slapt-get'='sudo slapt-get'
alias 'slapt-src'='sudo slapt-src'

alias 'scilab'='scilab-adv-cli'

alias 'webcam-get'='ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -f image2 ./snapshot.jpg 2>/dev/null'

alias 'aw'='audacious'

alias 'wireshark'='sudo wireshark'

alias 'pastebin'='pastebinit'

alias 'du'='du -hcs --apparent-size'

alias grep='grep --colour=auto'

alias    '..'='cd ..'
alias   '...'='cd ../..'
alias  '....'='cd ../../..'
alias '.....'='cd ../../../..'
alias     '~'='cd ~'
# "--" неизвестный мне хак (а может и не хак), без него не работает.
alias  -- '-'='cd -'

alias 'O_o'="echo '   ___          
  / _ \    ___  
 | | | |  / _ \ 
 | |_| | | (_) |
  \___/___\___/ 
     |_____|    
'"
alias 'o_O'="echo '           ___  
   ___    / _ \ 
  / _ \  | | | |
 | (_) | | |_| |
  \___/___\___/ 
     |_____|    
'"
alias 'gdb'='gdb -q'
alias 'objdump'='objdump -M intel'
alias 'dis'='objdump -M intel -D'
alias 'psgrep'='ps aux | grep -v grep | grep'
alias 'df'='df -h'

alias 'idal'='/home/michael/bin/idaadv/idal'
alias 'idal64'='/home/michael/bin/idaadv/idal64'
alias 'ida'='idal'
alias 'idawin'='wine /home/michael/bin/idaadv-win/idaq.exe'

alias 'netcat'='nc'
alias 'python-decompiler'='uncompyler.py'
alias 'hex'='hexedit'
alias 'upload'='ompload'
alias 'bc'='bc -q'
alias 'substract-from-file'='grep -F -x -v -f'
alias '2gis'='wine /home/michael/bin/2gis/3.0/grym.exe'
alias '?'='echo $?'
alias 'exifremove'='exiftool -all= '
alias 'exif'='exiftool'
alias 'wherein'='slackpkg file-search'

alias 'ssh-roman'='ssh root@172.16.194.93 -p27'

alias 'torrent'='transmission-remote'
alias 'pingt'='ping -c3 google.com'
alias 'pingn'='ping -c3 8.8.8.8'
alias 'feh-preview-save'='feh -t -Sfilename -E 240 -y 426 -W 1366 -O ./preview.jpg ./ &'
alias 'feh-preview'='feh -t -Sfilename -E 240 -y 426 -W 1366 ./ &'
alias 'md5'="cat /dev/urandom |head |md5sum |awk '{print \$1}'"
alias 'shred'='shred -n 10 -uz'
