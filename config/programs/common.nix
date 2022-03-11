{ pkgs }:
let callPackages = (import ../../lib).callPackages pkgs; in
{
  home-manager.enable = true;
  alacritty = callPackages ../alacritty.nix { };
  fish = callPackages ../fish { };
  git = callPackages ../git.nix { };
  neovim = callPackages ../neovim { };
}
