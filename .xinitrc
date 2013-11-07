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
xmodmap ~/.Xmodmap &
xrandr --dpi 106.11
xrdb ~/.Xresources
sh ~/.fehbg
xsetroot -cursor_name left_ptr
dunst &

if [[ $1 == "alopex" ]]
then
  exec /usr/bin/alopex 'conky -c ~/.conkyrc_alopex'
else 
  [ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
  mkfifo "$PANEL_FIFO"
  sxhkd &
  exec bspwm -s "$PANEL_FIFO" -p W
fi
