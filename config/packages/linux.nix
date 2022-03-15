{ pkgs, nixpkgs-unstable }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
import ./common.nix { inherit pkgs nixpkgs-unstable; } ++ [
  localPackages.apple-fonts.SF-Mono
  localPackages.apple-fonts.SF-Pro
  pkgs.xclip
]
