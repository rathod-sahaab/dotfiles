-------------------------------------------------------------------------------
-- WINDOW RULES & LAYER RULES
-------------------------------------------------------------------------------

-- Hyprland Polkit Authentication Agent (hyprpolkitagent)
hl.window_rule({
    name = "hyprpolkitagent-dialog",
    match = { class = "^(hyprpolkitagent)$" },
    float = true,
    dim_around = true,
    focus_on_activate = true,
})
