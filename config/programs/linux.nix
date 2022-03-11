{ pkgs }:
let callPackages = pkgs.callPackages; in
import ./common.nix { inherit pkgs; } // {
  tmux = callPackages ../tmux/linux.nix { };
  i3status = callPackages ../i3status.nix { };
  rofi = callPackages ../rofi.nix { };
}
