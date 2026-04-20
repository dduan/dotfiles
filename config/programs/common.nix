{ pkgs, ... }:
let callPackages = (import ../../lib).callPackages pkgs; in
{
  home-manager.enable = true;
  alacritty = callPackages ../alacritty.nix { };
  delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
    };
  };
  fish = callPackages ../fish { };
  git = callPackages ../git.nix { };
  neovim = callPackages ../neovim { };
  direnv = callPackages ../direnv.nix { };
}
