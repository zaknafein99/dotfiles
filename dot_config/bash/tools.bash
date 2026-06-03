# Atuin History
[ -f "$HOME/.atuin/bin/env" ] && . "$HOME/.atuin/bin/env"
eval "$(atuin init bash)"

# Zoxide (Better cd)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init bash)"
fi

# NVM (Node Version Manager)
set -h # Re-enable hashing for nvm compatibility
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
