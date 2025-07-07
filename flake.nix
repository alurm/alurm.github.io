{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    self,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.stdenv.mkDerivation {
        name = "alurm.github.io";
        src = self;
        
        nativeBuildInputs = with pkgs; [
          typst
          pandoc
          gnumake
        ];

        buildPhase = ''
          make
        '';

        installPhase = ''
          cp -r . $out
        '';
      };
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.typst
          pkgs.pandoc
        ];
      };
    });
}
