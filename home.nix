{ config, pkgs, ... }:
let
  tag = pkgs.callPackage ./packages/tag { };
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
      tag
      tig
      tre-command
    ];
  };
  news.display = "silent";
  programs = with pkgs; rec {
    # Home manager manages itself.
    home-manager.enable = true;

    # Program-specific configs.
    alacritty = import ./alacritty.nix { fish = pkgs.fish; };
    fish = import ./fish.nix { inherit fetchFromGitHub tag; };
    git = import ./git.nix;
    neovim = import ./neovim { inherit vimPlugins ripgrep; };
    tmux = import ./tmux { inherit pkgs; };
  };
}
