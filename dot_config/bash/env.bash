# Omarchy
export OMARCHY_PATH=$HOME/.local/share/omarchy
export PATH="$OMARCHY_PATH/bin:$HOME/.local/bin:$HOME/bin:$PATH"

# Editor
export SUDO_EDITOR="$EDITOR"
export BAT_THEME=ansi

# Color man pages with bat
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export HISTCONTROL=erasedups:ignoredups:ignorespace
