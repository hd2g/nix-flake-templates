{
  description = "TODO: Edit description message";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    cl-nix-lite.url = "github:hraban/cl-nix-lite";
  };

  outputs = { self, nixpkgs, flake-utils, cl-nix-lite }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system}.extend cl-nix-lite.overlays.default;
      in
        rec {
          devShells = {
            default = with pkgs.lispPackagesLite; lispDerivation {
              src = pkgs.lib.cleanSource ./.;
              lispSystem = "scratch";
              lispDependencies = [
                alexandria
                arrow-macros

                # HTTP Client
                #dexador

                # JSON
                #jonathan

                # O/R Mapper
                #mito

                # Date Time
                #local-time
                #cl-date-time-parser
              ];
            };
          };
        }
    );
}
