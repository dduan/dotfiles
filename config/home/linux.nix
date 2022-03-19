{ config, pkgs, extraPkgs, ... }:
import ./common.nix // {
  home.packages = import ../packages/linux.nix { inherit pkgs extraPkgs; };
  programs = import ../programs/linux.nix { inherit pkgs; };
  xsession.windowManager = {
    i3 = (import ../../lib).callPackages pkgs ../i3.nix { };
  };
}
