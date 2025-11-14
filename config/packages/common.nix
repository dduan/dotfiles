{ pkgs, ... }:
let localPackages = import ../../pkgs { inherit pkgs; }; in
with pkgs;
[
  bat
  ea
  fd
  fzf
  gnumake
  gotools
  htop
  jq
  localPackages.git-pile
  nixpkgs-fmt
  nodejs_22
  pyright
  ripgrep
  scc
  templ
  tig
  tre-command
  wget
]
