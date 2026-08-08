-------------------------------------------------------------------------------
-- MONITORS & WORKSPACES
-------------------------------------------------------------------------------

-- Work monitors
hl.monitor({
    output = "DP-1",
    mode = "preferred",
    position = "0x0",
    scale = "1.333",
})

hl.monitor({
    output = "DP-8",
    mode = "preferred",
    position = "2880x-100",
    scale = "1",
    transform = 3,
})

hl.monitor({
    output = "DP-9",
    mode = "preferred",
    position = "-1080x-100",
    scale = "1",
    transform = 1,
})

-- Workspace monitor assignments
hl.config({
    workspace = {
        "1, monitor:DP-9",
        "2, monitor:DP-1",
        "3, monitor:DP-8",
    },
})
