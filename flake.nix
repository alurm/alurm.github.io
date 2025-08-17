{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      self,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages = rec {
          default = tree;
          blog = pkgs.callPackage ./blog { };
          resume = pkgs.callPackage ./resume { };
          root = pkgs.callPackage ./root { };
          tree = pkgs.callPackage ./. {
            inherit
              blog
              resume
              root
              ;
          };
        };

        devShells.default = pkgs.mkShell {
          inputsFrom = builtins.attrValues self.packages.${system};
        };
      }
    );
}
