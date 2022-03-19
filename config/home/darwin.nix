{ config, pkgs, extraPkg, ... }:
import ./common.nix // {
  home.packages = import ../packages/darwin.nix { inherit pkgs extraPkgs; };
  programs = import ../programs/darwin.nix { inherit pkgs; };
}
