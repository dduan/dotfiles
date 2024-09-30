{ pkgs, pkgs-unstable, ... }:
let callPackages = pkgs.callPackages; in
import ./common.nix { inherit pkgs pkgs-unstable; } // {
  tmux = callPackages ../tmux/darwin.nix { };
}
