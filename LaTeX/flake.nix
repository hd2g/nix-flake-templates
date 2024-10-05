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
        tex = (pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-full
            dvisvgm dvipng
            wrapfig amsmath ulem hyperref capt-of;
        });
      in
        rec {
          devShells = {
            default = pkgs.mkShellNoCC {
              buildInputs = with pkgs; [
                tex
              ];
            };
          };
        }
    );
}
