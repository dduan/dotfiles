{ pkgs, pkgs-unstable }:
let callPackages = (import ../../lib).callPackages pkgs; in
import ./common.nix { inherit pkgs pkgs-unstable; } // {
  tmux = callPackages ../tmux/linux.nix { };
}
