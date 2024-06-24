#!/bin/bash

set -euo pipefail

echo "Post-installation tasks..."

# Oh My Zsh installation
echo "Please manually install Oh My Zsh by running:"
echo 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

# Build essentials (for Debian/Ubuntu users)
echo "If you're on Debian/Ubuntu, you might need to install build essentials:"
echo "sudo apt-get update && sudo apt-get install -y build-essential"

# LazyVim setup
echo "Setting up LazyVim..."
NVIM_CONFIG="$HOME/.config/nvim"
# Backup existing nvim config if it exists
if [ -d "$NVIM_CONFIG" ]; then
	echo "Backing up existing nvim config..."
	mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
fi

# Clone LazyVim config
echo "Please manually clone LazyVim config by running:"
echo "git clone https://github.com/LazyVim/starter $NVIM_CONFIG && rm -rf ${NVIM_CONFIG}/.git"

echo "Post-installation tasks complete!"