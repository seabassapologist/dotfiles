#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec ck-launch-session startkde
# exec startxfce4
# ...or the Window Manager of your choice

udiskie &

if [[ $1 == "e17" ]]
then
  exec enlightenment_start
elif [[ $1 == "dwm" ]]
then
  xsetroot -cursor_name left_ptr &
  xrdb ~/.Xresources &
  xset +fp /usr/share/fonts/artwiz-latin1-fonts &
#  xset +fp /usr/share/fonts/local &
  eval $(cat ~/.fehbg)
#  redshift -l 40.009333:-83.010871 -t 5700:4500 -m vidmode &
  
  conky | while read -r; do xsetroot -name "$REPLY"; done &
  exec dwm
else
  echo "Choose a WM/DE:\nkde\ndwm"
fi
