#!/bin/bash

set -euo pipefail # Exit on error, unset variable, or pipe failure.

echo "Starting installation..."

# Install nix
echo "Installing Nix..."
if ! curl -L https://nixos.org/nix/install | sh; then
	echo "Failed to install Nix. Exiting."
	exit 1
fi

# Source nix
echo "Sourcing Nix profile..."
NIX_PROFILE="$HOME/.nix-profile/etc/profile.d/nix.sh"
if [ -f "$NIX_PROFILE" ]; then
	source "$NIX_PROFILE"
else
	echo "Nix profile not found. Exiting."
	exit 1
fi

# Install zsh
echo "Installing Zsh..."
if ! nix-env -iA nixpkgs.zsh; then
	echo "Failed to install Zsh. Exiting."
	exit 1
fi

# Install packages
echo "Installing packages..."
if ! nix-env -iA \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.starship \
	nixpkgs.zoxide \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.yazi \
	nixpkgs.eza \
	nixpkgs.direnv \
	nixpkgs.git; then
	echo "Failed to install one or more packages. Exiting."
	exit 1
fi

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
	echo "Failed to install Oh My Zsh. Exiting."
	exit 1
fi

# Install Oh my posh
mkdir ~/bin
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/bin

# Install build essentials
echo "Installing build essentials..."
if ! sudo apt-get update || ! sudo apt-get install -y build-essential; then
	echo "Failed to install build essentials. Exiting."
	exit 1
fi

# Lazyvim setup
echo "Setting up LazyVim..."
NVIM_CONFIG="$HOME/.config/nvim"
# Backup existing nvim config if it exists
if [ -d "$NVIM_CONFIG" ]; then
	echo "Backing up existing nvim config..."
	mv "$NVIM_CONFIG" "${NVIM_CONFIG}.bak"
fi

# Optional but recommended backups
NVIM_LOCAL_SHARE="$HOME/.local/share/nvim"
if [ -d "$NVIM_LOCAL_SHARE" ]; then
	echo "Backing up .local/share/nvim..."
	mv "$NVIM_LOCAL_SHARE" "${NVIM_LOCAL_SHARE}.bak"
fi

NVIM_LOCAL_STATE="$HOME/.local/state/nvim"
if [ -d "$NVIM_LOCAL_STATE" ]; then
	echo "Backing up .local/state/nvim..."
	mv "$NVIM_LOCAL_STATE" "${NVIM_LOCAL_STATE}.bak"
fi

NVIM_CACHE="$HOME/.cache/nvim"
if [ -d "$NVIM_CACHE" ]; then
	echo "Backing up .cache/nvim..."
	mv "$NVIM_CACHE" "${NVIM_CACHE}.bak"
fi

# Clone LazyVim config
echo "Cloning LazyVim config..."
if ! git clone https://github.com/LazyVim/starter "$NVIM_CONFIG"; then
	echo "Failed to clone LazyVim config. Exiting."
	exit 1
fi
rm -rf "${NVIM_CONFIG}/.git"

echo "Installation complete!"
