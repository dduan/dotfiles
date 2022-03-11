{ pkgs }:
let
  localPackages = import ../../pkgs {
    inherit pkgs;
  };
  callPackages = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
in
import ./common.nix { inherit pkgs; } // {
  tmux = callPackages ../tmux/linux.nix { };
  i3status = callPackages ../i3status.nix { };
  rofi = callPackages ../rofi.nix { };
}
