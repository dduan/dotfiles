{ pkgs, pkgs-unstable }:
let callPackages = (import ../../lib).callPackages pkgs; in
import ./common.nix { inherit pkgs pkgs-unstable; } // {
  tmux = callPackages ../tmux/linux.nix { };
  i3status = callPackages ../i3status.nix { };
  rofi = callPackages ../rofi.nix { };
}
