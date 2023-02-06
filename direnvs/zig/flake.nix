{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        defaultPackages = pkgs.zig;
        devShell = pkgs.mkShell
          {
            buildInputs = [
              pkgs.zig
              pkgs.zls
            ];
          };
      }
    );
}
