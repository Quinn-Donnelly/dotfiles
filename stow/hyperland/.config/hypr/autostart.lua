-- Personal autostart: pin apps to workspaces and launch them at startup.

-- Window rules: keep these apps on their workspaces however they're opened.
o.window("spotify", { workspace = "1" })
o.window("chrome-discord.com__channels_@me-Default", { workspace = "2" })
o.window("signal", { workspace = "2" })

-- Launch the apps at startup on their assigned workspaces.
hl.on("hyprland.start", function()
  hl.exec_cmd(o.launch("spotify"), { workspace = "1" })
  hl.exec_cmd("omarchy-launch-webapp 'https://discord.com/channels/@me'", { workspace = "2" })
  hl.exec_cmd(o.launch("signal-desktop"), { workspace = "2" })
  hl.exec_cmd(o.launch("zen-browser"), { workspace = "3" })
  hl.exec_cmd(o.launch("zen-browser"), { workspace = "3" })
  hl.exec_cmd(o.launch("ghostty"), { workspace = "4" })
  hl.exec_cmd(o.launch("ghostty"), { workspace = "4" })
  hl.exec_cmd(o.launch("anki"), { workspace = "5" })
  hl.exec_cmd(o.launch("obsidian"), { workspace = "5" })

  hl.exec_cmd("~/.config/hypr/setup-layout.sh > ~/debug-layout.txt")
end)