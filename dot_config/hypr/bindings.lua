-- Application bindings.
hl.bind("SUPER + RETURN", hl.dsp.exec_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)"]]), { description = "Terminal" })
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd([[uwsm-app -- xdg-terminal-exec --dir="$(omarchy-cmd-terminal-cwd)" bash -c "tmux attach || tmux new -s Work"]]), { description = "Tmux" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd("uwsm-app -- nautilus --new-window"), { description = "File manager" })
hl.bind("SUPER + ALT + SHIFT + F", hl.dsp.exec_cmd([[uwsm-app -- nautilus --new-window "$(omarchy-cmd-terminal-cwd)"]]), { description = "File manager (cwd)" })
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("omarchy-launch-browser"), { description = "Browser" })
hl.bind("SUPER + SHIFT + ALT + B", hl.dsp.exec_cmd("omarchy-launch-browser --private"), { description = "Browser (private)" })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("omarchy-launch-or-focus spotify"), { description = "Music" })
hl.bind("SUPER + SHIFT + ALT + M", hl.dsp.exec_cmd("omarchy-launch-or-focus-tui cliamp"), { description = "Music TUI" })
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("omarchy-launch-editor"), { description = "Editor" })
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd("omarchy-launch-tui lazydocker"), { description = "Docker" })
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd([[omarchy-launch-or-focus ^signal$ "uwsm-app -- signal-desktop"]]), { description = "Signal" })
hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd([[omarchy-launch-or-focus ^obsidian$ "uwsm-app -- obsidian"]]), { description = "Obsidian" })
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("uwsm-app -- typora --enable-wayland-ime"), { description = "Typora" })
hl.bind("SUPER + SHIFT + SLASH", hl.dsp.exec_cmd("uwsm-app -- 1password"), { description = "Passwords" })

-- Web app bindings.
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://chatgpt.com"]]), { description = "ChatGPT" })
hl.bind("SUPER + SHIFT + ALT + A", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://grok.com"]]), { description = "Grok" })
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://app.hey.com/calendar/weeks/"]]), { description = "Calendar" })
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://app.hey.com"]]), { description = "Email" })
hl.bind("SUPER + SHIFT + Y", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://youtube.com/"]]), { description = "YouTube" })
hl.bind("SUPER + SHIFT + ALT + G", hl.dsp.exec_cmd([[omarchy-launch-or-focus-webapp WhatsApp "https://web.whatsapp.com/"]]), { description = "WhatsApp" })
hl.bind("SUPER + SHIFT + CTRL + G", hl.dsp.exec_cmd([[omarchy-launch-or-focus-webapp "Google Messages" "https://messages.google.com/web/conversations"]]), { description = "Google Messages" })
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd([[omarchy-launch-or-focus-webapp "Google Photos" "https://photos.google.com/"]]), { description = "Google Photos" })
hl.bind("SUPER + SHIFT + X", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://x.com/"]]), { description = "X" })
hl.bind("SUPER + SHIFT + ALT + X", hl.dsp.exec_cmd([[omarchy-launch-webapp "https://x.com/compose/post"]]), { description = "X Post" })

-- Add extra bindings below.
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm-app -- thunar"), { description = "Thunar" })
hl.bind("SUPER + SHIFT + Z", hl.dsp.exec_cmd("uwsm-app -- zen-browser"), { description = "Zen Browser" })
hl.bind("SUPER + O", hl.dsp.exec_cmd("uwsm-app -- opencode-desktop"), { description = "Opencode" })
hl.bind("SUPER + A", hl.dsp.exec_cmd("uwsm-app -- antigravity-ide"), { description = "Antigravity" })
hl.bind("SUPER + H", hl.dsp.exec_cmd([[env DESKTOPINTEGRATION=1 /home/isma/AppImages/hermes_agent.appimage --no-sandbox]]), { description = "Hermes" })

-- Workspace switching (por nombre de tecla, mas confiable que code:N en Wayland)
for i = 1, 9 do
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = tostring(i) }), { description = "Switch to workspace " .. i })
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }), { description = "Move window to workspace " .. i })
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }), { description = "Switch to workspace 10" })
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }), { description = "Move window to workspace 10" })

-- Keyboard layout switch (us <-> es)
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd([[hyprctl switchxkblayout all next && notify-send -t 1000 "⌨️ Teclado" "$(hyprctl devices | grep 'active keymap' | head -1 | awk -F': ' '{print $2}')"]]), { description = "Switch keyboard layout" })

-- Overwrite existing bindings with hl.unbind() first if needed.
-- hl.unbind("SUPER + SPACE")
-- hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("omarchy-menu"), { description = "Omarchy menu" })

-- Logitech MX Keys examples:
-- hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("omarchy-capture-screenshot"))
-- hl.bind("SUPER + H", hl.dsp.exec_cmd("voxtype record toggle"))
-- hl.bind("SUPER + PERIOD", hl.dsp.exec_cmd("omarchy-launch-walker -m symbols"))
