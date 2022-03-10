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
    defaultWorkspace = "workspace number 9";
    fonts = {
      names = [ "SF Mono" "pango:DejaVu Sans Mono" ];
      size = 10.0;
    };
  };
}
