{ config, pkgs, pkgs-unstable, ... }:
import ./common.nix // {
  home =
    {
      file = {
        "Library/Application Support/Rectangle/RectangleConfig.json".source = ../RectangleConfig.json;
        ".config/tig/config".source = ../tig_config_darwin;
      };
      packages = import ../packages/darwin.nix { inherit pkgs; };
    };
  programs = import ../programs/darwin.nix {
    inherit pkgs pkgs-unstable;
  };
}
