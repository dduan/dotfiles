{ reattach-to-user-namespace, fish }:
let
  common = import ./tmux-common.nix;
  reattach = "${reattach-to-user-namespace}/bin/reattach-to-user-namespace";
in
common // {
  extraConfig = common.extraConfig + ''

     bind-key -T copy-mode-vi y send -X copy-pipe "${reattach} pbcopy"
     set-option -g default-command "${reattach} -l ${fish}/bin/fish"
     '';
}
