{ config, pkgs, ... }:

{
  home = {
    username = "dduan";
    homeDirectory = "/Users/dduan";
    stateVersion = "22.05";
    packages = with pkgs; [
      ripgrep
      tmux
      bat
      nixpkgs-fmt
    ];
  };
  programs = with pkgs; rec {
    home-manager.enable = true;
    fish = import ./fish.nix { inherit fetchFromGitHub; };
    alacritty = import ./alacritty.nix { fish = pkgs.fish; };
    git = import ./git.nix;
    neovim = import ./neovim.nix;
  };
}
