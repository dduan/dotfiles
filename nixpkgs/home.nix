{ config, pkgs, ... }:

{
  home = {
    username = "dduan";
    homeDirectory = "/Users/dduan";
    stateVersion = "22.05";
    packages = with pkgs; [
      bat
      ripgrep
      nixpkgs-fmt
      tig
    ];
  };
  programs = with pkgs; rec {
    # Home manager manages itself.
    home-manager.enable = true;

    # Program-specific configs.
    alacritty = import ./alacritty.nix { fish = pkgs.fish; };
    fish = import ./fish.nix { inherit fetchFromGitHub; };
    git = import ./git.nix;
    neovim = import ./neovim.nix;
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
