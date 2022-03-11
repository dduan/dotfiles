{ config, pkgs, ... }:
import ./common.nix // {
  home.packages = import ../packages/darwin.nix { inherit pkgs; };
  programs = import ../programs/darwin.nix { inherit pkgs; };
}
