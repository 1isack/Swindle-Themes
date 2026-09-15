sloppy_focus               = true
bypass_surface_visibility  = false
log_level                  = "error"  -- "silent", "error", "info", "debug"

local wal_ok, wal = pcall(dofile, os.getenv("HOME") .. "/.cache/wal/swindle-colors.lua")
if not wal_ok then wal = {} end

appearance = {
    inner_border_px  = 2,
    outer_border_px  = 4,
    gaps             = 10,
    smart_gaps       = false,

    root_color          = wal.root_color         or 0x2b2723ff,
    inner_border_color  = wal.inner_border_color or 0x88b1b7ff,
    inner_focus_color   = wal.inner_focus_color  or 0x5998a4ff,
    inner_urgent_color  = wal.inner_urgent_color or 0xff0000ff,
    outer_border_color  = wal.outer_border_color or 0x2b2723ff,
    outer_focus_color   = wal.outer_focus_color  or 0x2b2723ff,
    outer_urgent_color  = wal.outer_urgent_color or 0xff0000ff,

    fullscreen_bg    = wal.root_color or 0x2b2723ff,
    inactive_opacity = 1.0,
    active_opacity   = 1.0,
}

input = {
    repeat_rate             = 50,
    repeat_delay            = 150,
    tap_to_click            = true,
    tap_and_drag            = true,
    drag_lock               = true,
    natural_scrolling       = false,
    disable_while_typing    = true,
    left_handed             = false,
    middle_button_emulation = false,
    scroll_method           = "2fg",
    click_method            = "button_areas",
    accel_profile           = "adaptive",
    accel_speed             = 0.0,
}

rules = {
--   { app_id = "Gimp",    floating = true,  monitor = -1 },
--   { app_id = "firefox", tags = 1 << 8,    floating = false, monitor = -1 },
}

monitors = {
    { name = nil, mfact = 0.55, nmaster = 1, scale = 1.0,
      layout = "dwindle", x = -1, y = -1 },

    -- { name = "eDP-1", mfact = 0.5, nmaster = 1, scale = 2.0,
    --   layout = "dwindle", x = -1, y = -1 },
}

autostart = {
    "waybar",
    "/home/isaak/.local/bin/wal -R",
}

keybinds = {
    { mods = {"logo"},          key = "return",     action = "spawn",  args = {"foot"} },
    { mods = {"logo"},          key = "space", action = "spawn",  args = {"rofi", "-show", "drun"} },
    { mods = {"logo"},          key = "q",     action = "killclient" },
    { mods = {"logo"},          key = "v",     action = "togglefloating" },
    { mods = {"logo"},          key = "f",     action = "togglefullscreen" },
    { mods = {"logo"},          key = "g",     action = "togglegaps" },
    { mods = {"logo"},          key = "h",     action = "focusdir",  args = {"left"} },
    { mods = {"logo"},          key = "j",     action = "focusdir",  args = {"down"} },
    { mods = {"logo"},          key = "k",     action = "focusdir",  args = {"up"} },
    { mods = {"logo"},          key = "l",     action = "focusdir",  args = {"right"} },
    { mods = {"logo", "shift"}, key = "H",     action = "swapdir",   args = {"left"} },
    { mods = {"logo", "shift"}, key = "J",     action = "swapdir",   args = {"down"} },
    { mods = {"logo", "shift"}, key = "K",     action = "swapdir",   args = {"up"} },
    { mods = {"logo", "shift"}, key = "L",     action = "swapdir",   args = {"right"} },
    { mods = {"logo"},          key = "Tab",   action = "view" },
    { mods = {"logo"},          key = "0",     action = "view",      args = {"all"} },
    { mods = {"logo"},          key = "comma",  action = "focusmon", args = {"left"} },
    { mods = {"logo"},          key = "period", action = "focusmon", args = {"right"} },
    { mods = {"logo", "shift"}, key = "less",    action = "tagmon", args = {"left"} },
    { mods = {"logo", "shift"}, key = "greater", action = "tagmon", args = {"right"} },
    { mods = {"logo", "shift"}, key = "m",     action = "quit" },
}

for i = 1, 9 do
    local key  = tostring(i)
    local mask = 1 << (i - 1)
    table.insert(keybinds, { mods = {"logo"},                    key = key, action = "view",      args = {tostring(mask)} })
    table.insert(keybinds, { mods = {"logo", "ctrl"},            key = key, action = "toggleview", args = {tostring(mask)} })
    table.insert(keybinds, { mods = {"logo", "shift"},           key = key, action = "tag",        args = {tostring(mask)} })
    table.insert(keybinds, { mods = {"logo", "ctrl", "shift"},   key = key, action = "toggletag",  args = {tostring(mask)} })
end

buttons = {
    { mods = {"logo"}, button = "left",   action = "moveresize",     args = {"move"} },
    { mods = {"logo"}, button = "middle", action = "togglefloating" },
    { mods = {"logo"}, button = "right",  action = "moveresize",     args = {"resize"} },
}
