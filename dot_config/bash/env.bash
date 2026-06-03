# PATH and basic exports
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

export HISTCONTROL=erasedups:ignoredups:ignorespace

# Omarchy Envs
export OMARCHY_PATH=$HOME/.local/share/omarchy
[ -f "$OMARCHY_PATH/default/bash/envs" ] && source "$OMARCHY_PATH/default/bash/envs"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
