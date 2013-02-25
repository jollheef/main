#!/bin/bash
# Variables:
#   TR_APP_VERSION
#   TR_TIME_LOCALTIME
#   TR_TORRENT_DIR
#   TR_TORRENT_HASH
#   TR_TORRENT_ID
#   TR_TORRENT_NAME

# "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}":
#  /home/torrents/complete/Directory
#  /home/torrents/complete/File.ext

TorrentFiles="${TR_TORRENT_DIR}/${TR_TORRENT_NAME}"

if [ -d "${TorrentFiles}" ]; then
    # If directory:
    TypeOf=$(
	{
	    find "${TorrentFiles}" -type f |while read File; do
		file -b --mime-type "${File}" |cut -d '/' -f 1
	    done
	} |sed 's/[^a-zA-Z]/\n/g' \
	    |uniq -cd |sort -nr |head -n 1 |awk '{print $2}')
else
    # If file:
    TypeOf=$(file -b --mime-type "${TorrentFiles}" \
	|cut -d '/' -f 1)
fi

case "${TypeOf}" in
    audio)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/msc/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/msc/"
	;;
    video)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/vds/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/vds/"
	;;
    image)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/img/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/img/"
	;;
    text)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/etc/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/etc/"
	;;
    application)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/iso-install/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/iso-install/"
	;;
    *)
	transmission-remote -t ${TR_TORRENT_ID} --move \
	    "/home/michael/ldd/" &
	DISPLAY=:0 notify-send -t 5000 'Torrent::Download Complete' \
	    "${TR_TORRENT_NAME} moved to /home/michael/ldd/"
	;;
esac
