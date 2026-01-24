#! /usr/bin/env bash

wait_for_program() {
  echo "Waiting for $1 window in Hyprland..."
  while ! hyprctl clients | grep -iq $1; do
    sleep 0.5
  done
  echo "$1 window detected."
}

# race condition due to hyprctl needing to run after apps are running
wait_for_program "anki"
wait_for_program "Obsidian"
sleep 5

hyprctl dispatch workspace 2
hyprctl dispatch layoutmsg togglesplit
hyprctl dispatch splitratio -0.2

hyprctl dispatch workspace 3
hyprctl dispatch layoutmsg togglesplit
hyprctl dispatch splitratio -0.2

hyprctl dispatch workspace 4 
hyprctl dispatch layoutmsg togglesplit
hyprctl dispatch splitratio -0.2

hyprctl dispatch workspace 5
hyprctl dispatch layoutmsg togglesplit
hyprctl dispatch splitratio -0.2
hyprctl dispatch swapwindow d
