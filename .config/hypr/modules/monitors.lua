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
hl.workspace_rule({
    workspace="1",
    monitor="DP-9"
})
hl.workspace_rule({
    workspace="2",
    monitor="DP-1"
})
hl.workspace_rule({
    workspace="3",
    monitor="DP-8"
})