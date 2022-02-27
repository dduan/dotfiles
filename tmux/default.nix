{ pkgs }:
with pkgs;
if stdenv.isLinux then
  import ./tmux-linux.nix { inherit xclip; }
else
  import ./tmux-darwin.nix { inherit reattach-to-user-namespace fish; }
