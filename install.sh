# Install nix
curl -L https://nixos.org/nix/install | sh

# Source nix
. /home/isma/.nix-profile/etc/profile.d/nix.sh

# Install zsh
nix-env -iA nixpkgs.zsh

# Install packages
nix-env -iA \
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
	nixpkgs.direnv \
	nixpkgs.git

# Install Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
