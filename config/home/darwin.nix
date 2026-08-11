{ config, pkgs, pkgsUnstable, ... }:
import ./common.nix { inherit pkgs; } // {
  home =
    {
      file = {
        "Library/Application Support/Rectangle/RectangleConfig.json".source = ../RectangleConfig.json;
        ".config/tig/config".source = ../tig_config_darwin;
      };
      packages = import ../packages/darwin.nix { inherit pkgs pkgsUnstable; };
    };
  programs = import ../programs/darwin.nix {
    inherit pkgs pkgsUnstable;
  };
}
