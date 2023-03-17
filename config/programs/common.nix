{ pkgs }:
let callPackages = (import ../../lib).callPackages pkgs; in
{
  home-manager.enable = true;
  alacritty = callPackages ../alacritty.nix { };
  wezterm = callPackages ../wezterm.nix { };
  fish = callPackages ../fish { };
  git = callPackages ../git.nix { };
  neovim = callPackages ../neovim { };
  direnv = callPackages ../direnv.nix { };
}
