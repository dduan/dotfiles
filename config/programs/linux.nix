{ pkgs, pkgsUnstable }:
let callPackages = (import ../../lib).callPackages pkgs; in
import ./common.nix { inherit pkgs pkgsUnstable; } // {
  tmux = callPackages ../tmux/linux.nix { };
}
