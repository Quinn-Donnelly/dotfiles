-- Personal monitor setup.
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported modes: hyprctl monitors all

-- 1x displays.
hl.env("GDK_SCALE", "1")

hl.monitor({ output = "DP-2", mode = "3840x2160@144", position = "auto", scale = 1.07, bitdepth = 10 })
hl.monitor({ output = "DP-3", mode = "preferred", position = "auto-left", scale = 1, bitdepth = 10 })

-- Workspace layout across monitors.
hl.workspace_rule({ workspace = "1", monitor = "DP-2" })
hl.workspace_rule({ workspace = "2", monitor = "DP-2" })
hl.workspace_rule({ workspace = "3", monitor = "DP-2" })
hl.workspace_rule({ workspace = "4", monitor = "DP-2" })
hl.workspace_rule({ workspace = "5", monitor = "DP-2" })
hl.workspace_rule({ workspace = "9", monitor = "DP-3" })