-- Personal autostart: pin apps to their workspaces only at boot, then launch
-- them on those workspaces.
--
-- Placement relies on named window rules rather than the exec_cmd workspace
-- option. exec_cmd pins by tracking the spawned PID, and o.launch() wraps
-- commands in uwsm-app (which spawns asynchronously through a daemon), so the
-- PID is lost and apps intermittently land wherever the focus happened to be.
-- Window rules apply whenever the app window actually opens, so they're
-- reliable even for forked/async launches. They are disabled shortly after
-- startup so apps opened later from the launcher stay where you open them.

hl.on("hyprland.start", function()
  local bootRules = {
    hl.window_rule({ name = "boot-spotify", match = { class = "Spotify" }, workspace = "1" }),
    hl.window_rule({ name = "boot-discord", match = { class = "chrome-discord.com__channels_@me-Default" }, workspace = "2" }),
    hl.window_rule({ name = "boot-signal", match = { class = "signal" }, workspace = "2" }),
    hl.window_rule({ name = "boot-zen", match = { class = "zen" }, workspace = "3" }),
    hl.window_rule({ name = "boot-ghostty", match = { class = "com.mitchellh.ghostty" }, workspace = "4" }),
    hl.window_rule({ name = "boot-anki", match = { class = "anki" }, workspace = "5" }),
    hl.window_rule({ name = "boot-obsidian", match = { class = "md.obsidian.Obsidian" }, workspace = "5" }),
  }

  hl.exec_cmd(o.launch("spotify"), { workspace = "1" })
  hl.exec_cmd(o.launch("signal-desktop"), { workspace = "2" })
  hl.exec_cmd("omarchy-launch-webapp 'https://discord.com/channels/@me'", { workspace = "2" })
  hl.exec_cmd(o.launch("zen-browser"), { workspace = "3" })
  hl.exec_cmd(o.launch("zen-browser"), { workspace = "3" })
  hl.exec_cmd(o.launch("ghostty"), { workspace = "4" })
  hl.exec_cmd(o.launch("ghostty"), { workspace = "4" })
  hl.exec_cmd(o.launch("anki"), { workspace = "5" })
  hl.exec_cmd(o.launch("obsidian"), { workspace = "5" })

  hl.exec_cmd("~/.config/hypr/setup-layout.sh > ~/debug-layout.txt")

  -- Stop pinning windows once startup has settled.
  hl.timer(function()
    for _, rule in ipairs(bootRules) do
      rule:set_enabled(false)
    end
  end, { timeout = 90000, type = "oneshot" })
end)