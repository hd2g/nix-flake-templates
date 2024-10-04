{
  description = "TODO: Edit description message";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    easy-purescript-nix.url = "github:justinwoo/easy-purescript-nix";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        easy-ps = easy-purescript-nix.packages.${system};
      in
        rec {
          devShells = {
            default = pkgs.mkShellNoCC {
              buildInputs = with pkgs; [
                pkgs.nodejs-slim_22
                pkgs.pnpm
                pkgs.esbuild
                pkgs.dhall
                pkgs.dhall-lsp-server
                easy-ps.purs-0_15_15
                easy-ps.spago
                easy-ps.purescript-language-server
                easy-ps.purs-tidy
              ];
            };
          };
        }
    );
}
