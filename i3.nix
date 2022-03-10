{ alacritty }:
let mod = "Mod1"; in
{
  enable = true;
  config = {
    modifier = mod;
    window = {
      border = 0;
      titlebar = false;
    };
    terminal = "${alacritty}/bin/alacritty";
    defaultWorkspace = "1";
    fonts = {
      names = [ "SF Mono" "pango:DejaVu Sans Mono" ];
      size = 8.0;
    };
  };
  extraConfig = ''
    exec alacritty
    exec i3-msg workspace 1
  '';
}
