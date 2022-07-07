{ pkgs }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
with pkgs;
[
  bat
  ea
  fd
  fzf
  gh
  gnumake
  htop
  jq
  localPackages.git-pile
  nixpkgs-fmt
  pyright
  ripgrep
  tokei
  tre-command
  wget
]
