-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and resolutions possible: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = "auto"

-- Optimized for retina-class 2x displays, like 13" 2.8K, 27" 5K, 32" 6K.
-- local omarchy_gdk_scale = 2
-- local omarchy_monitor_scale = "auto"

-- Good compromise for 27" or 32" 4K monitors (but fractional!): monitor scale 1.6, GDK scale 1.75.
-- local omarchy_gdk_scale = 1.75
-- local omarchy_monitor_scale = 1.6

-- Straight 1x setup for low-resolution displays like 1080p, 1440p, or ultrawides: both 1.
-- local omarchy_gdk_scale = 1
-- local omarchy_monitor_scale = 1

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
-- Set DP-1 to 180Hz (maximum high refresh rate) with 10-bit color and standard sRGB (highly vibrant VA contrast).
hl.monitor({ output = "DP-1", mode = "3440x1440@180", position = "0x0", scale = omarchy_monitor_scale, bitdepth = 10, cm = "srgb" })
-- hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°)
hl.monitor({ output = "HDMI-A-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })

-- Example for Framework 13 w/ 6K XDR Apple display.
-- hl.monitor({ output = "DP-5", mode = "6016x3384@60", position = "auto", scale = 2 })
-- hl.monitor({ output = "eDP-1", mode = "2880x1920@120", position = "auto", scale = 2 })

-- Disable the second ghost monitor on an Apple 6K XDR over Thunderbolt.
-- hl.monitor({ output = "DP-2", disabled = true })

-- Disable virtual monitor (e.g., from Sunshine) so it doesn't steal workspaces.
hl.monitor({ output = "Virtual-1", disabled = true })

-- Workspaces 1-4 on primary monitor (DP-1), 5-10 on secondary (HDMI-A-2).
hl.workspace_rule({ workspace = "1", monitor = "DP-1", default = true })
for ws = 2, 4 do
  hl.workspace_rule({ workspace = tostring(ws), monitor = "DP-1" })
end
hl.workspace_rule({ workspace = "5", monitor = "HDMI-A-2", default = true })
for ws = 6, 10 do
  hl.workspace_rule({ workspace = tostring(ws), monitor = "HDMI-A-2" })
end
