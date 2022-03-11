{ pkgs }:
let
  localPackages = import ../../pkgs {
    inherit pkgs;
  };
  callPackages = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
in
{
  home-manager.enable = true;
  alacritty = callPackages ../alacritty.nix { };
  fish = callPackages ../fish { };
  git = callPackages ../git.nix { };
  neovim = callPackages ../neovim { };
}
