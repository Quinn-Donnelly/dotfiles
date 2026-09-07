-- Personal keybinding overrides.
-- Omarchy defaults load before this file, so unbind before rebinding.

-- Vim-style pane navigation (replaces the default arrow-key movement).
-- The default bindings on these keys are unbound first.
hl.unbind("SUPER + K") -- was: Keybindings
hl.unbind("SUPER + J") -- was: Toggle window split
hl.unbind("SUPER + L") -- was: Toggle workspace layout
hl.unbind("SUPER + O") -- was: Pop window out

-- SUPER+SHIFT+S was Google Maps (preinstalled); reuse it for split toggle.
hl.unbind("SUPER + SHIFT + S")

o.bind("SUPER + SHIFT + ALT + K", "Show key bindings", "omarchy-menu-keybindings")
o.bind("SUPER + SHIFT + S", "Toggle Split", hl.dsp.layout("togglesplit"))

o.bind("SUPER + H", "Move focus left", hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + L", "Move focus right", hl.dsp.focus({ direction = "r" }))
o.bind("SUPER + K", "Move focus up", hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + J", "Move focus down", hl.dsp.focus({ direction = "d" }))

o.bind("SUPER + ALT + H", "Move window to group on left", hl.dsp.window.move({ into_group = "l" }))
o.bind("SUPER + ALT + L", "Move window to group on right", hl.dsp.window.move({ into_group = "r" }))
o.bind("SUPER + ALT + K", "Move window to group on top", hl.dsp.window.move({ into_group = "u" }))
o.bind("SUPER + ALT + J", "Move window to group on bottom", hl.dsp.window.move({ into_group = "d" }))

o.bind("SUPER + SHIFT + H", "Swap window to the left", hl.dsp.window.swap({ direction = "l" }))
o.bind("SUPER + SHIFT + L", "Swap window to the right", hl.dsp.window.swap({ direction = "r" }))
o.bind("SUPER + SHIFT + K", "Swap window up", hl.dsp.window.swap({ direction = "u" }))
o.bind("SUPER + SHIFT + J", "Swap window down", hl.dsp.window.swap({ direction = "d" }))

-- Audio device switching.
o.bind("SUPER + O", "Switch to Speakers", "sh -c '~/.config/hypr/audio-sink-switch.sh AudioBox_USB_96'")
o.bind("SUPER + I", "Switch to Headphones", "sh -c '~/.config/hypr/audio-sink-switch.sh Arctis_Pro_Wireless-00.stereo-game'")
o.bind("SUPER + B", "Switch to Bluetooth Headphones", "sh -c '~/.config/hypr/audio-sink-switch.sh bluez_output'")

o.bind("SUPER + equal", "Increase Volume", "sh -c '~/.local/bin/scripts/sink-volume --increase'")
o.bind("SUPER + minus", "Decrease Volume", "sh -c '~/.local/bin/scripts/sink-volume --decrease'")