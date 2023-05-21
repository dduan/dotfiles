{ config, pkgs, ... }:
import ./common.nix // {
  home.file = {
    "Library/Application Support/Rectangle/RectangleConfig.json".source = ../RectangleConfig.json;
  };
  home.packages = import ../packages/darwin.nix { inherit pkgs; };
  programs = import ../programs/darwin.nix { inherit pkgs; };
}
