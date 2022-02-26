{ config, pkgs, ... }:
let
  tag = pkgs.callPackage ./packages/tag {};
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
  programs = with pkgs; rec {
    # Home manager manages itself.
    home-manager.enable = true;

    # Program-specific configs.
    alacritty = import ./alacritty.nix { fish = pkgs.fish; };
    fish = import ./fish.nix { inherit fetchFromGitHub tag; };
    git = import ./git.nix;
    neovim = import ./neovim.nix {
      vimPlugins = pkgs.vimPlugins;
      rg = pkgs.ripgrep;
    };
    tmux =
      if pkgs.stdenv.isLinux then
        import ./tmux-linux.nix { inherit xclip; }
      else
        import ./tmux-darwin.nix {
          reattach-to-user-namespace = pkgs.reattach-to-user-namespace;
          fish = pkgs.fish;
        }
    ;
  };
}
