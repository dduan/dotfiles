{ pkgs, extraPkgs }: with pkgs; [
  bat
  fd
  fzf
  gnumake
  htop
  librsvg
  extraPkgs.tre-command
  extraPkgs.nixpkgs-unstable.python39Packages.python-lsp-server
  nixpkgs-fmt
  python39Packages.ipython
  ripgrep
  tig
  wget
]
