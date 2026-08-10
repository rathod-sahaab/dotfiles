-------------------------------------------------------------------------------
-- HYPRLAND LUA CONFIGURATION ENTRYPOINT
-------------------------------------------------------------------------------

-- Load modular configuration components
require("modules.monitors")
require("modules.autostart")
require("modules.decorations")
require("modules.env")
require("modules.keyboard")
require("modules.windowrules")

-------------------------------------------------------------------------------
-- INPUT & PER-DEVICE CONFIGURATION
-------------------------------------------------------------------------------

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0,
        touchpad = {
            natural_scroll = false,
        },
    },
    device = {
        {
            name = "epic-mouse-v1",
            sensitivity = -0.5,
        },
    },
})
