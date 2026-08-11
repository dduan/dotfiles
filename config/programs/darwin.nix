{ pkgs, pkgsUnstable, ... }:
let callPackages = pkgs.callPackages; in
import ./common.nix { inherit pkgs pkgsUnstable; } // {
  tmux = callPackages ../tmux/darwin.nix { };
}
