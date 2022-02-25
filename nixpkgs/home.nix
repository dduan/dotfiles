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
    ];
  };
  programs = rec {
    home-manager.enable = true;
    alacritty = import ./alacritty.nix { fish = pkgs.fish; };
    fish = import ./fish.nix;
    git = import ./git.nix;
    neovim = import ./neovim.nix;
  };
}
