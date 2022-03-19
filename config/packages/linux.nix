{ pkgs, extraPkgs }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
import ./common.nix { inherit pkgs extraPkgs; } ++ [
  localPackages.apple-fonts.SF-Mono
  localPackages.apple-fonts.SF-Pro
  pkgs.xclip
]
