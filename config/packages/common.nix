{ pkgs, nixpkgs-unstable }: with pkgs; [
  bat
  direnv
  fd
  fzf
  gnumake
  htop
  librsvg
  nixpkgs-unstable.python39Packages.python-lsp-server
  nixpkgs-fmt
  python39Packages.ipython
  ripgrep
  tig
  tre-command
  wget
]
