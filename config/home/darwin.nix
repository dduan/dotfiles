{ config, pkgs, nixpkgs-unstable, ... }:
import ./common.nix // {
  home.packages = import ../packages/darwin.nix { inherit pkgs nixpkgs-unstable; };
  programs = import ../programs/darwin.nix { inherit pkgs; };
}
