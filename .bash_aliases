#
# Package management
#

alias 'apt-get'='sudo apt-get'
alias 'aptitude'='sudo aptitude -V'

# Install pkg
alias _yi='sudo aptitude -V install'
# Install pkg from unstable
alias _yiu='sudo aptitude -V -t unstable install'
# Install pkg from experimental
alias _yie='sudo aptitude -V -t experimental install'
# Remove pkg
alias _yr='sudo aptitude remove'
# Search pkg
alias _ys='sudo aptitude search'
# Update pkgs
#alias yu='sudo aptitude update && sudo aptitude upgrade -V'
alias _yu='sudo aptitude upgrade -V'
# Find package by file
alias 'wherein'='dpkg -S'

#
# Navigation
#

# Exit
alias ':q'='exit'
alias q='exit'
alias 'й'='exit'
alias quit='exit'
alias exi='exit'

alias '..'='cd ..'
alias '~'='cd ~'
alias -- '-'='cd -'

#
# Run prefer as root
#

alias 'wireshark'='sudo wireshark'
alias 'shutdown'='sudo shutdown -h now'
alias 'reboot'='sudo reboot'
alias 'service'='sudo service'
alias 'rcconf'='sudo rcconf'
alias 'dpkg-reconfigure'='sudo dpkg-reconfigure'
alias 'dpkg'='sudo dpkg'

#
# Common
#

alias '?'='echo $?'
alias 'du'='du -hcs --apparent-size'
alias grep='grep --colour=auto'
alias 'psgrep'='ps aux | grep -v grep | grep'
alias 'df'='df -h'
alias 'bc'='bc -ql'
alias 'shred'='shred -n 10 -uz'
alias 'mc'='mc -b'
alias 'gcc'='gcc -Wall'
alias 'g++'='g++ -Wall'

alias 'gdb'='gdb -q'
alias 'objdump'='objdump -M intel'

alias 'pastebin'='pastebincl -g -p'
alias 'aw'='audacious'
alias 'netcat'='nc'
alias 'python-decompiler'='uncompyler.py'
alias 'hex'='hexedit'
#alias 'upload'='/'
alias 'torrent'='transmission-remote'

alias 'idal'='/home/michael/bin/idaadv/idal'
alias 'idal64'='/home/michael/bin/idaadv/idal64'
alias 'ida'='idal'
alias 'idawin'='wine /home/michael/bin/idaadv-win/idaq.exe'
alias 'idawin64'='wine /home/michael/bin/ida61/idaq64.exe'
alias 'steganographystudio'='java -jar ~/bin/steganographystudio.jar'

alias '2gis'='wine /home/michael/bin/2gis/3.0/grym.exe'

alias 'pingt'='ping -c3 google.com'
alias 'pingn'='ping -c3 8.8.8.8'

alias 'gcc-win'='i586-mingw32msvc-gcc'
alias 'g++-win'='i586-mingw32msvc-g++'

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
alias 'haskell-run'='runhaskell'
alias 'ps-lambda'="PS1='λ> '"

#
# Pseudo-utils
#

alias 'substract-from-file'='grep -F -x -v -f'
alias 'feh-preview-save'='feh -t -Sfilename -E 240 -y 426 -W 1366 -O ./preview.jpg ./ &'
alias 'feh-preview'='feh -t -Sfilename -E 240 -y 426 -W 1366 ./ &'
function md5 () {
	 echo "Hey! This is a RANDOM md5"
	 cat /dev/urandom |head |md5sum |awk '{print $1}'
}
#alias 'modfind'='find /lib/modules/`uname -r` -name '*.ko' |grep'
alias 'webcam-get'='ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -f image2 ./$(date +"%Y-%m-%d-%s".jpg) 2>/dev/null'
alias 'webcam'='mplayer -fs -fps 30 -tv driver=v4l2:width=640:height=480:device=/dev/video0 tv:// 1>/dev/null 2>&1'
alias 'makeiso'='genisoimage -v -iso-level 4 -J -o'
alias 'fdisk-watch'='while [ 1 ]; do clear; fdisk -l; sleep 0.1s; done'
alias 'lib-search'='cat /home/michael/lib/librusec/LibRusEc_ru.text |grep -i '

# Show IP
SHOWIP='ip.icanhazip.com'
alias 'show-ext-ip'='echo -n Ext IP: && links          -dump $SHOWIP'
alias 'show-tor-ip'='echo -n Tor IP: && links -socks-proxy 127.0.0.1:9050 -dump $SHOWIP'
alias 'tex2pdf'='textopdf'

alias 'dosd'='dos -dumb'
alias 'hexcalc'='dhex /dev/null'

# for manage vbox
function startvm () {
    vboxmanage startvm "${1}" --type headless
}
function listvms () {
    vboxmanage list vms
}
function runningvms () {
    vboxmanage list runningvms
}
function stopvm () {
    vboxmanage controlvm "${1}" acpipowerbutton
}
alias 'mkvgui'='mmg'
alias 'c'='clear'
alias pwgen="pwgen -0 -s 31 1"

alias 'wicd-cli-eth-list'='wicd-cli --wired --list'
alias 'wicd-cli-wlan-list'='wicd-cli -y -S && wicd-cli -y -l'
alias 'wicd-cli-disconnect'='wicd-cli --disconnect'

alias 'iwl'='wicd-cli -yl'
alias 'iwc'='wicd-cli -ycn'
alias 'wget-site'='wget -r -k -p -E -nc'
alias 'wget-site-depth7'='wget -r -k -p -E -nc -l 7'

alias 'bootlog'="sudo sed 's/\^\[/\o33/g;s/\[1G\[/\[27G\[/' /var/log/boot"

function iu () {imgur upload ${1} |grep orig}

function find-urls-by-filenames ()
{
    if [[ "${1}" == "" || "${2}" == "" ]]; then
	echo "Use: ${0} path url-list"; fi
    filesPath="${1}"
    urlsList="${2}"
    for filename in $(ls "${filesPath}"); do
	cat "${urlsList}" |grep "${filename}"; done
}

alias 'nmap1'='sudo nmap -T5 -F -D 172.16.254.254 -PS22,23,80,113'
alias 'nmap2'='sudo nmap -D 172.16.254.254 -T5 -p0-65535'
alias 'nmap3'='sudo nmap -D 172.16.254.254 -T5 -F'
alias 'nmap4'='sudo nmap -D 172.16.254.254 -T5'

alias 'sleep1'='date && sleep && date'

#alias 'convert-xcf-to-png'='gimp -n -i -b - <<EOF
#(let* ( (file's (cadr (file-glob "*.xcf" 1))) (filename "") (image 0) (layer 0) )
#  (while (pair? file's) 
#    (set! image (car (gimp-file-load RUN-NONINTERACTIVE (car file's) (car file's))))
#    (set! layer (car (gimp-image-merge-visible-layers image CLIP-TO-IMAGE)))
#    (set! filename (string-append (substring (car file's) 0 (- (string-length (car file's)) 4)) ".png"))
#    (gimp-file-save RUN-NONINTERACTIVE image layer filename filename)
#    (gimp-image-delete image)
#    (set! file's (cdr file's))
#    )
#  (gimp-quit 0)
#  )
#EOF
#'

alias siv='send_image varejka17'
alias mount-iso='mount -o loop'