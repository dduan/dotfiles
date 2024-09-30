{ pkgs, ... }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
with pkgs;
[
  bat
  ea
  fd
  fzf
  gnumake
  htop
  jq
  localPackages.git-pile
  nixpkgs-fmt
  pyright
  ripgrep
  scc
  tig
  tre-command
  wget
]
