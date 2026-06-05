local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Diseño y Estética General
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font_with_fallback({
	{ family = "MonaspiceNe Nerd Font", weight = "Regular" },
	{ family = "Iosevka Nerd Font", weight = "Regular" },
	{ family = "JetBrainsMono Nerd Font", weight = "Regular" },
})
config.font_size = 12.5
config.harfbuzz_features = {
	"calt=1", "liga=1",
	"ss01=1", "ss02=1", "ss03=1", "ss04=1", "ss05=1",
	"ss06=1", "ss07=1", "ss08=1", "ss09=1", "ss10=1",
}
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = wezterm.action.CompleteSelection("ClipboardAndPrimarySelection"),
	},
}

-- Ventana (transparencia)
config.window_background_opacity = 0.65
config.window_close_confirmation = "NeverPrompt"
config.adjust_window_size_when_changing_font_size = false
config.window_decorations = "NONE"
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

-- Pestañas y Barra de Estado
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

config.colors = {
	split = "#313244",
	tab_bar = {
		background = "#11111b", -- crust
		active_tab = {
			bg_color = "#89b4fa",
			fg_color = "#11111b",
		},
		inactive_tab = {
			bg_color = "#181825",
			fg_color = "#a6adc8",
		},
		inactive_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
		new_tab = {
			bg_color = "#181825",
			fg_color = "#a6adc8",
		},
		new_tab_hover = {
			bg_color = "#313244",
			fg_color = "#cdd6f4",
		},
	},
}

-- Formatear títulos de pestañas dinámicamente con iconos geniales
wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#181825"
	local foreground = "#a6adc8"

	if tab.is_active then
		background = "#89b4fa" -- azul de catppuccin mocha
		foreground = "#11111b"
	elseif hover then
		background = "#313244"
		foreground = "#cdd6f4"
	end

	local title = tab.active_pane.title
	local process_name = string.gsub(tab.active_pane.foreground_process_name or "", "(.*)/", "")
	if process_name == "" then
		process_name = "shell"
	end

	-- Iconos específicos para procesos conocidos
	local icon = " "
	if string.find(process_name, "nvim") or string.find(process_name, "vim") then
		icon = " "
	elseif string.find(process_name, "git") or string.find(process_name, "lazygit") then
		icon = " "
	elseif
		string.find(process_name, "node")
		or string.find(process_name, "npm")
		or string.find(process_name, "yarn")
	then
		icon = " "
	elseif string.find(process_name, "python") then
		icon = " "
	elseif string.find(process_name, "docker") or string.find(process_name, "compose") then
		icon = "󰡨 "
	elseif string.find(process_name, "ssh") then
		icon = "󰣀 "
	elseif
		string.find(process_name, "sudo")
		or string.find(process_name, "htop")
		or string.find(process_name, "btop")
	then
		icon = "󰥔 "
	end

	local tab_index = tab.tab_index + 1
	local display_title = string.format(" %d: %s%s ", tab_index, icon, process_name)

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = display_title },
	}
end)

-- Barra de estado derecha súper estética
wezterm.on("update-right-status", function(window, pane)
	local cells = {}

	-- Espacio de trabajo activo
	local workspace = window:active_workspace()
	table.insert(cells, "󰨇 " .. workspace)

	-- Fecha y hora
	local time = wezterm.strftime("󱑆 %H:%M")
	table.insert(cells, time)

	local colors = {
		"#89b4fa", -- blue
		"#cba6f7", -- mauve
	}

	local elements = {}
	for i, cell in ipairs(cells) do
		local color = colors[(i - 1) % #colors + 1]
		table.insert(elements, { Background = { Color = "#181825" } })
		table.insert(elements, { Foreground = { Color = color } })
		table.insert(elements, { Text = "  " .. cell .. "  " })
		if i < #cells then
			table.insert(elements, { Foreground = { Color = "#313244" } })
			table.insert(elements, { Text = "|" })
		end
	end

	window:set_right_status(wezterm.format(elements))
end)

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Comportamiento y Rendimiento
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
config.max_fps = 144
config.scrollback_lines = 10000
config.inactive_pane_hsb = {
	saturation = 0.7,
	brightness = 0.4,
}

-- Cursor elegante con transición fluida
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_ease_in = "EaseIn"
config.cursor_blink_ease_out = "EaseOut"
config.cursor_blink_rate = 800

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Atajos de Teclado Prácticos (Keybindings)
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- División de paneles (Panes) con LEADER
	{
		key = "s",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "v",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Navegación rápida entre paneles (ALT + HJKL o ALT + Flechas)
	{ key = "h", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "k", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "j", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = wezterm.action.ActivatePaneDirection("Down") },

	-- Redimensionar paneles (ALT + SHIFT + HJKL o ALT + SHIFT + Flechas)
	{ key = "h", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "l", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "k", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "j", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Left", 5 }) },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Right", 5 }) },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Up", 5 }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = wezterm.action.AdjustPaneSize({ "Down", 5 }) },

	-- Zoom / maximizar panel activo (LEADER + Z, libre de conflictos)
	{ key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- Gestión de Pestañas (Tabs) con CTRL + SHIFT (estándar libre de conflictos)
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ key = "w", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ key = "[", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	{ key = "]", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(1) },

	-- Copiar / Pegar nativo
	{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.PasteFrom("Clipboard") },
}

-- Mapear ALT + [1-9] para ir directamente a la pestaña correspondiente (evita conflicto con Hyprland)
for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

return config
