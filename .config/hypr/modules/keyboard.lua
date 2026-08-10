-------------------------------------------------------------------------------
-- KEYBINDINGS & MOUSE BINDS
-------------------------------------------------------------------------------

local mainMod = "SUPER"

-- Core application & window binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("alacritty"), { description = "Launch terminal emulator" })
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), { description = "Close active window" })
hl.bind(mainMod .. " + M", hl.dsp.exit(), { description = "Exit Hyprland compositor" })
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("brave"), { description = "Launch Brave web browser" })
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"), { description = "Launch Nautilus file manager" })
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle window floating mode" })
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill wofi || wofi"), { description = "Toggle Wofi application launcher" })

-- Layout & window states
hl.bind(mainMod .. " + P", hl.dsp.exec_raw("pseudo,"), { description = "Toggle pseudo tiling mode" })
hl.bind(mainMod .. " + LEFT", hl.dsp.exec_raw("layoutmsg, togglesplit"), { description = "Toggle split orientation" })
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggle fullscreen mode" })
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen_state({ 
    internal = 0, 
    client = 2, 
    action = "toggle" 
}), { description = "Toggle client-side fullscreen state" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen_state({ 
    internal = 2, 
    client = 0, 
    action = "toggle" 
}), { description = "Toggle internal fullscreen state" })

-- Screenshots
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("grimblast copysave area"), { description = "Take area screenshot and copy to clipboard" })

-- Directional window focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }), { description = "Move window focus left" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }), { description = "Move window focus down" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }), { description = "Move window focus up" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }), { description = "Move window focus right" })

-- Workspaces (1 to 10)
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }), { description = "Switch to workspace " .. i })
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.exec_raw("movetoworkspace, " .. i), { description = "Move active window to workspace " .. i })
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = "10" }), { description = "Switch to workspace 10" })
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.exec_raw("movetoworkspace, 10"), { description = "Move active window to workspace 10" })

-- Quick actions & session control
hl.bind(mainMod .. " + CTRL + B", hl.dsp.exec_cmd("pkill waybar || waybar"), { description = "Toggle Waybar status bar" })
hl.bind(mainMod .. " + CTRL + Q", hl.dsp.submap("logout"), { description = "Enter logout submap menu" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("hyprlock & systemctl suspend"), { description = "Lock screen and suspend system" })

-- Logout submap mode (activated via Super + Ctrl + Q)
-- Once in this mode, press single key (l/e/h/r/s/u) to perform action, or Escape to cancel.
hl.define_submap("logout", function()
    hl.bind("l", hl.dsp.exec_cmd("hyprlock & hyprctl dispatch submap reset"), { description = "Lock screen" })
    hl.bind("e", hl.dsp.exec_cmd("loginctl terminate-user $USER & hyprctl dispatch submap reset"), { description = "Exit session / logout" })
    hl.bind("h", hl.dsp.exec_cmd("systemctl hibernate & hyprctl dispatch submap reset"), { description = "Hibernate system" })
    hl.bind("r", hl.dsp.exec_cmd("systemctl reboot & hyprctl dispatch submap reset"), { description = "Reboot system" })
    hl.bind("s", hl.dsp.exec_cmd("systemctl poweroff & hyprctl dispatch submap reset"), { description = "Shutdown power off" })
    hl.bind("u", hl.dsp.exec_cmd("hyprlock & systemctl suspend & hyprctl dispatch submap reset"), { description = "Suspend / sleep" })
    hl.bind("escape", hl.dsp.submap("reset"), { description = "Cancel logout submap mode" })
end)

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.exec_raw("togglespecialworkspace, magic"), { description = "Toggle special workspace (scratchpad)" })
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_raw("movetoworkspace, special:magic"), { description = "Move active window to special workspace" })

-- Mouse workspace scrolling
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "Switch to next workspace via scroll" })
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "Switch to previous workspace via scroll" })

-- Mouse move & resize windows
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move active window with mouse drag" })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { description = "Resize active window with mouse drag" })

-- Laptop multimedia keys (volume & brightness)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true, description = "Raise audio volume" })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true, description = "Lower audio volume" })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true, description = "Toggle audio mute" })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true, description = "Toggle microphone mute" })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { repeating = true, locked = true, description = "Increase display brightness" })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { repeating = true, locked = true, description = "Decrease display brightness" })

-- Media player controls
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true, description = "Next media track" })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Pause media playback" })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true, description = "Play/pause media playback" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true, description = "Previous media track" })
