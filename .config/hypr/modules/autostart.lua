-------------------------------------------------------------------------------
-- AUTOSTART
-------------------------------------------------------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swaync")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("udisksctl mount -b /dev/disk/by-uuid/13d99148-7e87-48df-a802-5d7f0937213e || true")
end)
