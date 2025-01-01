{ pkgs }:
{
  news.display = "silent";
  xdg.configFile = {
    "nix/nix.conf".text = "experimental-features = nix-command flakes";
    "ghostty/config".text = ''
      font-family = SF Mono Nerd
      font-size = 16
      theme = GruvboxDarkHard
      macos-titlebar-style = hidden
      command = ${pkgs.fish}/bin/fish -c "${pkgs.tmux}/bin/tmux attach; or ${pkgs.tmux}/bin/tmux"
    '';
  };
  fonts.fontconfig.enable = true;
}
