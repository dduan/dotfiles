{ config, pkgs, pkgs-unstable, ... }:
import ./common.nix // {
  home = {
    packages = import ../packages/linux.nix { inherit pkgs; };
    file = {
      ".config/tig/config".source = ../tig_config_linux;
    };
  };
  programs = import ../programs/linux.nix { inherit pkgs pkgs-unstable; };
  xsession.windowManager = {
    i3 = (import ../../lib).callPackages pkgs ../i3.nix { };
  };
}
