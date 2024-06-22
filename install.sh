# Install nix
curl -L https://nixos.org/nix/install | sh

# Install zsh
nix-env -iA nixpkgs.zsh

# Install packages
nix-env -iA \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.tmux \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.fzf \
	nixpkgs.ripgrep \
	nixpkgs.bat \
	nixpkgs.direnv \
	nixpkgs.git
