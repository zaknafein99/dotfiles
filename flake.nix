{
    description = "A development environment setup with Zsh, Neovim, Tmux, and other tools";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
        flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = import nixpkgs {
                    inherit system;
                };
            in {
                packages.default = pkgs.buildEnv {
                    name = "dev-env";
                    paths = with pkgs; [
                        zsh
                        antibody
                        neovim
                        tmux
                        stow
                        starship
                        zoxide
                        yarn
                        fzf
                        ripgrep
                        bat
                        direnv
                        git
                    ];
                };

                devShell = pkgs.mkShell {
                    buildInputs = with pkgs; [
                        zsh
                        antibody
                        neovim
                        tmux
                        stow
                        starship
                        zoxide
                        yarn
                        fzf
                        ripgrep
                        bat
                        direnv
                        git
                    ];

                    shellHook = ''
                        echo "Please manually install Oh My Zsh and LazyVim following the instructions provided."
                    '';
                };
            });
}