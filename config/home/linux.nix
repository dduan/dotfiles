{ config, pkgs, pkgsUnstable, ... }:
import ./common.nix { inherit pkgs; } // {
  home = {
    packages = import ../packages/linux.nix { inherit pkgs pkgsUnstable; };
    file = {
      ".config/tig/config".source = ../tig_config_linux;
    };
  };
  programs = import ../programs/linux.nix { inherit pkgs pkgsUnstable; };
}
