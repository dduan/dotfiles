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
  nixpkgs-fmt
  ripgrep
  tig
  tokei
  tre-command
  wget
  localPackages.git-pile
  pyright
]
