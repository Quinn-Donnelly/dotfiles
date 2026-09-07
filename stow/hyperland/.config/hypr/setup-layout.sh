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

# Hyprland 0.55+ evaluates `dispatch` args as Lua, so commands use the new
# hl.dsp.* dispatcher forms rather than the legacy "workspace 2" / "layoutmsg"
# strings.
hyprctl dispatch 'hl.dsp.focus({ workspace = 2 })'
hyprctl dispatch 'hl.dsp.layout("togglesplit")'
hyprctl dispatch 'hl.dsp.layout("splitratio -0.2")'
# ensure Discord ends up on the bottom of workspace 2
hyprctl dispatch 'hl.dsp.focus({ window = "class:chrome-discord.com__channels_@me-Default" })'
hyprctl dispatch 'hl.dsp.window.swap({ direction = "d" })'
hyprctl dispatch 'hl.dsp.focus({ direction = "d" })'

hyprctl dispatch 'hl.dsp.focus({ workspace = 3 })'
hyprctl dispatch 'hl.dsp.layout("togglesplit")'
hyprctl dispatch 'hl.dsp.layout("splitratio -0.2")'
hyprctl dispatch 'hl.dsp.focus({ direction = "d" })'

hyprctl dispatch 'hl.dsp.focus({ workspace = 4 })'
hyprctl dispatch 'hl.dsp.layout("togglesplit")'
hyprctl dispatch 'hl.dsp.layout("splitratio -0.2")'
hyprctl dispatch 'hl.dsp.focus({ direction = "d" })'

hyprctl dispatch 'hl.dsp.focus({ workspace = 5 })'
hyprctl dispatch 'hl.dsp.layout("togglesplit")'
hyprctl dispatch 'hl.dsp.layout("splitratio -0.2")'
hyprctl dispatch 'hl.dsp.window.swap({ direction = "d" })'
hyprctl dispatch 'hl.dsp.focus({ direction = "d" })'