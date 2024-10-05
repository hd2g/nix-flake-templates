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
      in
        rec {
          devShells = {
            default = pkgs.mkShellNoCC {
              buildInputs = with pkgs; [
                racket-minimal
              ];

              # shellHook = ''
              #   if [[ -z "$(raco pkg show | grep typed-racket)" ]]; then
              #     read -p "Do you want to install typed-racket?(Y/n): " yn
              #     case "$yn" in
              #       [nN]*) ;;
              #       *)
              #         yes | raco pkg install typed-racket
              #         ;;
              #     esac
              #   fi
              # '';
            };
          };
        }
    );
}
