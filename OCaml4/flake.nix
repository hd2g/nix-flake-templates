{
  description = "TODO: Edit description message";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_4_14;
      in
        rec {
          devShells = {
            default = pkgs.mkShellNoCC {
              buildInputs = with pkgs; [
              ] ++ (with ocamlPackages; [
                dune_3
                ocaml
                merlin
              ]);
            };
          };
        }
    );
}
