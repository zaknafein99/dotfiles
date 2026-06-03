-- Gaming optimizations for Hyprland (Safe Mode)
-- Pro-tip: Use gamescope for the best experience with Doom Eternal.

hl.config({
  general = {
    -- Allows games to bypass the compositor's V-Sync for lower latency.
    allow_tearing = true,
  },
  input = {
    -- Disable mouse acceleration for consistent aim in FPS games.
    accel_profile = "flat",
  },
  misc = {
    -- Adaptive Sync / VRR: 0 = off, 1 = on, 2 = fullscreen only.
    vrr = 2,
  }
})

-- Doom specific rules (Commented out by user request)
--[[
local doom_matches = {
  { class = "DOOMEternal" },
  { class = "steam_app_782330" },
  { class = "DOOMTheDarkAges" },
  { class = "steam_app_3017860" },
}

for _, match in ipairs(doom_matches) do
  -- Ensure it stays in fullscreen and has full opacity.
  hl.window_rule({ match = match, opacity = "1 1" })
  hl.window_rule({ match = match, fullscreen = true })
  -- Prevent the screen from turning off while playing.
  hl.window_rule({ match = match, idle_inhibit = "always" })
end
--]]
