{ config, pkgs, nixpkgs-unstable, ... }:
import ./common.nix // {
  home.packages = import ../packages/linux.nix { inherit pkgs nixpkgs-unstable; };
  programs = import ../programs/linux.nix { inherit pkgs; };
  xsession.windowManager = {
    i3 = (import ../../lib).callPackages pkgs ../i3.nix { };
  };
}
