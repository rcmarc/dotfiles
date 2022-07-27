#!/bin/bash

function run {
  if ! pgrep -x $(basename $1 | head -c 15) 1>/dev/null;
  then
    $@&
  fi
}

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
  cp $HOME/.config/qtile/config-azerty.py $HOME/.config/qtile/config.py
fi

#starting utility applications at boot time
run nm-applet &
run xfce4-power-manager &
/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

#starting user applications at boot time
run cbatticon &
