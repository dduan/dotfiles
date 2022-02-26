{ xclip }:
let
  common = import ./tmux-common.nix;
in
common // {
  extraConfig = common.extraConfig + ''

   unbind y
   bind-key -T copy-mode-vi y send -X copy-pipe "${xclip}/bin/xclip -selection clipboard >/dev/null"
   '';
}
