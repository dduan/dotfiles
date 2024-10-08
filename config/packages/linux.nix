{ pkgs }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
import ./common.nix { inherit pkgs; } ++ [
  localPackages.apple-fonts.SF-Mono
  localPackages.apple-fonts.SF-Pro
  localPackages.sf-mono-nerd
  pkgs.xclip
]
