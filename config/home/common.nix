{
  news.display = "silent";
  xdg.configFile."nix/nix.conf".text = "experimental-features = nix-command flakes";
  fonts.fontconfig.enable = true;
}
