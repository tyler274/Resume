{
  description = "Tyler Port resume - Tectonic LaTeX dev shell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ pkgs.tectonic ];

          shellHook = ''
            echo "Resume dev shell (Tectonic)"
            echo "  $(tectonic --version)"
            echo ""
            echo "  build: tectonic resume.tex"
          '';
        };

        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
