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

#udiskie & 
xmodmap ~/.Xmodmap &
#xrandr --dpi 106.11
xrdb ~/.Xresources

if [[ $1 == "kde" ]]
then
  exec startkde
else
  sh ~/.fehbg
  xsetroot -cursor_name left_ptr
  compton --backend glx --vsync opengl-swc --paint-on-overlay &

  conky | while read -r; do xsetroot -name "$REPLY"; done &
 exec dwm
fi
