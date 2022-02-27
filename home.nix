{ config, pkgs, ... }:
let
  localPackages = import ./packages { inherit pkgs; };
  callPackages = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
in
{
  home = {
    username = "dduan";
    homeDirectory = "/Users/dduan";
    stateVersion = "22.05";
    packages = with pkgs; [
      bat
      fd
      nixpkgs-fmt
      ripgrep
      tig
      tre-command
    ];
  };
  news.display = "silent";
  programs = rec {
    # Home manager manages itself.
    home-manager.enable = true;

    # Program-specific configs.
    alacritty = callPackages ./alacritty.nix { };
    fish = callPackages ./fish.nix { };
    git = callPackages ./git.nix { };
    neovim = callPackages ./neovim { };
    tmux =
      if pkgs.stdenv.isLinux
      then callPackages ./tmux/tmux-linux.nix { }
      else callPackages ./tmux/tmux-darwin.nix { };
  };
}
