#!/bin/sh

#       ___   _____             _    _            _ _   
#      /_\ \ / / _ \___ ___  __| |_ | |____ _ _ _(_) |__
#     / _ \ V /|   /___/ _ \/ _| ' \| / / _` | '_| | / /
#    /_/ \_\_/ |_|_\   \___/\__|_||_|_\_\__,_|_| |_|_\_\
                                                                                                           
if [ ! -S /tmp/mpv-socket ]; then
	mpv --no-audio --idle --input-ipc-server=/tmp/mpv-socket --geometry=100%x100% --loop-file=inf & sleep 1
fi

while true; do

TRACK=$(mpc current -f %file%)
PAT="$HOME/music/$TRACK"
ALBUM=$(dirname "$PAT")
COVER=""$ALBUM"/cover.jpg"

if [ -f "$COVER" ]; then
	echo "loadfile \"$COVER\"" | socat - /tmp/mpv-socket
fi

mpc idle player

done
