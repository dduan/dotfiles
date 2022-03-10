{ alacritty, i3status }:
let
  mod = "Mod1";
  fonts = {
    names = [ "SF Pro" ];
    size = 7.0;
  };
in
{
  enable = true;
  config = {
    modifier = mod;
    inherit fonts;
    bars = [{
      inherit fonts;
      statusCommand = "${i3status}/bin/i3status";
    }];
    window = {
      border = 0;
      titlebar = false;
    };
    terminal = "${alacritty}/bin/alacritty";
    defaultWorkspace = "1";
    keybindings = {
      "${mod}+Return" = "exec ${alacritty}/bin/alacritty";
      "${mod}+w" = "kill";
      "${mod}+h" = "focus left";
      "${mod}+l" = "focus right";
      "${mod}+j" = "focus down";
      "${mod}+k" = "focus up";
      "${mod}+d" = "exec --no-startup-id rofi -show drun -show-icons";
      "${mod}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";
      "${mod}+Shift+r" = "restart";
      "${mod}+1" = "workspace number 1";
      "${mod}+2" = "workspace number 2";
      "${mod}+3" = "workspace number 3";
      "${mod}+4" = "workspace number 4";
      "${mod}+5" = "workspace number 5";
      "${mod}+6" = "workspace number 6";
      "${mod}+7" = "workspace number 7";
      "${mod}+8" = "workspace number 8";
      "${mod}+9" = "workspace number 9";
      "${mod}+0" = "workspace number 10";
      "${mod}+Shift+1" = "move container to workspace number 1";
      "${mod}+Shift+2" = "move container to workspace number 2";
      "${mod}+Shift+3" = "move container to workspace number 3";
      "${mod}+Shift+4" = "move container to workspace number 4";
      "${mod}+Shift+5" = "move container to workspace number 5";
      "${mod}+Shift+6" = "move container to workspace number 6";
      "${mod}+Shift+7" = "move container to workspace number 7";
      "${mod}+Shift+8" = "move container to workspace number 8";
      "${mod}+Shift+9" = "move container to workspace number 9";
      "${mod}+Shift+0" = "move container to workspace number 10";
    };
  };
  extraConfig = ''
    exec alacritty
    exec i3-msg workspace 1
  '';
}
