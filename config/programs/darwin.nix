{ pkgs }:
let callPackages = pkgs.callPackages; in
import ./common.nix { inherit pkgs; } // {
  tmux = callPackages ../tmux/darwin.nix { };
}
