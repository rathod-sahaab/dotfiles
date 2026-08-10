-------------------------------------------------------------------------------
-- WINDOW RULES & LAYER RULES
-------------------------------------------------------------------------------

-- GNOME Polkit Authentication Agent
hl.window_rule({
    name = "polkit-gnome-dialog",
    match = { class = "^(polkit-gnome-authentication-agent-1|Polkit-gnome-authentication-agent-1)$" },
    float = true,
    dim_around = true,
    focus_on_activate = true,
})
