{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils, nixpkgs-unstable }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        stable = nixpkgs.legacyPackages.${system};
        unstable = nixpkgs-unstable.legacyPackages.${system};
      in
      {
        defaultPackage = stable.ipython;
        devShell = stable.mkShell {
          buildInputs = [
            stable.python39Packages.ipython
            unstable.python39Packages.python-lsp-server
          ];
        };
      }
    );
}
