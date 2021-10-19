if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  MOZ_ENABLE_WAYLAND=1 XDG_SESSION_TYPE=wayland exec sway
fi
