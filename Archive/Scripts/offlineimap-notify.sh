#!/usr/bin/bash

offlineimap -o -q -u quiet

maildirnew="$HOME/Mail/matthome/INBOX/new/"
new="$(find $maildirnew -type f | wc -l)"

maildirold="$HOME/Mail/matthome/INBOX/cur/"
old="$(find $maildirold -type f | wc -l)"

if [ $new -gt 0 ] 
then
    export DISPLAY=:0; export XAUTHORITY=~/.Xauthority; notify-send -a "OfflineIMAP" "New mail!\nNew: $new Old: $old"
fi