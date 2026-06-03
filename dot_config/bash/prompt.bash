# Starship Initialization
if [[ $- == *i* ]] && command -v starship &> /dev/null; then
  # NOTA: No limpiamos PROMPT_COMMAND aquí porque rompería Atuin/Zoxide
  eval "$(starship init bash)"
fi

# Apply Fixes for terminal quirks (VTE 0.76 / Ghostty / Alacritty)
if [[ ${BLE_VERSION-} ]]; then
  bleopt prompt_ps1_final=
  bleopt prompt_ps1_transient=
  bleopt canvas_winch_action=redraw-here
  
  # Bind Atuin to Ctrl-R using ble.sh hooks
  blehook/eval-after-load keymap_vi 'ble-bind -m vi_imap -f C-r __atuin_history'
  blehook/eval-after-load keymap_emacs 'ble-bind -m emacs -f C-r __atuin_history'
fi
