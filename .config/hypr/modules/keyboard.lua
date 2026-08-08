-------------------------------------------------------------------------------
-- KEYBINDINGS & MOUSE BINDS
-------------------------------------------------------------------------------

local mainMod = "SUPER"

-- Core application & window binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind(mainMod .. " + Q", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill wofi || wofi"))

-- Layout & window states
hl.bind(mainMod .. " + P", hl.dsp.exec_raw("pseudo,"))
hl.bind(mainMod .. " + LEFT", hl.dsp.exec_raw("layoutmsg, togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.exec_raw("fullscreen"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_raw("fullscreenstate, 2 0"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.exec_raw("fullscreenstate, 0 2"))

-- Screenshots
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("grimblast copysave area"))

-- Directional window focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))

-- Workspaces (1 to 10)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.exec_raw("movetoworkspace, " .. i))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.exec_raw("movetoworkspace, 10"))

-- Quick actions & session control
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("pkill waybar || waybar"))
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.submap("logout"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprlock & systemctl suspend"))

-- Logout submap mode (activated via Super + Ctrl + Q)
-- Once in this mode, press single key (l/e/h/r/s/u) to perform action, or Escape to cancel.
hl.define_submap("logout", function()
    hl.bind("l", hl.dsp.exec_cmd("hyprlock & hyprctl dispatch submap reset"))                      -- [L]ock screen
    hl.bind("e", hl.dsp.exec_cmd("loginctl terminate-user $USER & hyprctl dispatch submap reset")) -- [E]xit session / logout
    hl.bind("h", hl.dsp.exec_cmd("systemctl hibernate & hyprctl dispatch submap reset"))           -- [H]ibernate system
    hl.bind("r", hl.dsp.exec_cmd("systemctl reboot & hyprctl dispatch submap reset"))              -- [R]eboot system
    hl.bind("s", hl.dsp.exec_cmd("systemctl poweroff & hyprctl dispatch submap reset"))            -- [S]hutdown power off
    hl.bind("u", hl.dsp.exec_cmd("hyprlock & systemctl suspend & hyprctl dispatch submap reset")) -- s[U]spend / sleep
    hl.bind("escape", hl.dsp.submap("reset"))                                                      -- Cancel / exit submap mode
end)

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.exec_raw("togglespecialworkspace, magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_raw("movetoworkspace, special:magic"))

-- Mouse workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse move & resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Laptop multimedia keys (volume & brightness)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true })

-- Media player controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
