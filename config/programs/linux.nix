{ pkgs }:
let callPackages = (import ../../lib).callPackages pkgs; in
import ./common.nix { inherit pkgs; } // {
  tmux = callPackages ../tmux/linux.nix { };
}
