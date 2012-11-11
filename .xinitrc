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

if [[ $1 == "kde" ]]
then
  exec startkde
elif [[ $1 == "dwm" ]]
then
  xsetroot -cursor_name left_ptr &
  xrdb ~/.Xresources &
  xset +fp /usr/share/fonts/artwiz-latin1-fonts &
  eval $(cat ~/.fehbg)
  
  conky | while read -r; do xsetroot -name "$REPLY"; done &
  exec dwm
else
  echo "Choose a WM/DE:\nkde\ndwm"
fi
