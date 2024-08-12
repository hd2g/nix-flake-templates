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
        ocamlPackages = pkgs.ocaml-ng.ocamlPackages_5_2;
      in
        rec {
          devShells = {
            default = pkgs.mkShellNoCC {
              UTOP_SITE_LSIP = "${ocamlPackages.utop}/share/emacs/site-lisp";
              MERLIN_SITE_LSIP = "${ocamlPackages.merlin}/share/emacs/site-lisp";
              OCP_INDENT_SITE_LSIP = "${ocamlPackages.ocp-indent}/share/emacs/site-lisp";

              buildInputs = with pkgs; [
              ] ++ (with ocamlPackages; [
                dune_3
                ocaml
                merlin
                dot-merlin-reader
                ocp-indent
                utop

                # More packages...
              ]);
            };
          };
        }
    );
}
