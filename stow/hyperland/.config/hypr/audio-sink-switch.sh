#! /usr/bin/env bash
pactl list short sinks | grep $1 | awk '{print $1}' | xargs pactl set-default-sink
notify-send "Switching to $1"
