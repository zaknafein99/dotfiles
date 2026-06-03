-- Learn how to configure Hyprland: https://wiki.hypr.land/Configuring/Start/

local home = os.getenv("HOME") or ""

-- Hyprland recommends require() for split Lua configs. These two roots let us
-- load user modules from ~/.config and Omarchy defaults from $OMARCHY_PATH.
package.path = home
	.. "/.config/?.lua;"
	.. (os.getenv("OMARCHY_PATH") or (home .. "/.local/share/omarchy"))
	.. "/?.lua;"
	.. package.path

local paths = require("default.hypr.paths")
require("default.hypr.helpers")

hl.env("PATH", paths.omarchy_path .. "/bin:" .. (os.getenv("PATH") or ""))

-- Use Omarchy defaults, but don't edit these directly.
require("default.hypr.autostart")
require("default.hypr.bindings.media")
require("default.hypr.bindings.clipboard")
require("default.hypr.bindings.tiling-v2")
require("default.hypr.bindings.utilities")
require("default.hypr.envs")
require("default.hypr.looknfeel")
require("default.hypr.input")
require("default.hypr.windows")

-- Doom: The Dark Ages Window Exemption Blocks (Commented out by user request)
--[[
hl.window_rule({
	match = { class = "steam_app_3017860" },
	immediate = true,
	float = true,
	--stayfocused = true,
})
--]]

-- Current theme overrides.
do
	local theme = io.open(paths.config_home .. "/omarchy/current/theme/hyprland.lua", "r")
	if theme then
		theme:close()
		require("omarchy.current.theme.hyprland")
	end
end

-- Change your own setup in these files and override defaults.
require("hypr.monitors")
require("hypr.input")
require("hypr.bindings")
require("hypr.looknfeel")
require("hypr.autostart")

-- Toggle config flags dynamically.
require("default.hypr.toggles")

-- Gaming optimizations.
require("hypr.games")

-- Add any other personal Hyprland configuration below.
-- hl.window_rule({ match = { class = "qemu" }, workspace = "5" })

-- Inhibit screen idle/locking when any application is fullscreen (videos, games, etc.)
hl.window_rule({ match = { class = ".*" }, idle_inhibit = "fullscreen" })


-- Blur on waybar
hl.layer_rule({
  match = { namespace = "waybar" },
  blur = true,
})
