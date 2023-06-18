{ fish }:
{
  enable = true;
  settings = {
    dpi = {
      x = 220;
      y = 220;
    };
    env.TERM = "xterm-256color";
    shell = {
      program = "${fish}/bin/fish";
      args = [
        "--login"
        "--command=tmux attach; or tmux"
      ];
    };
    font = {
      size = 14.0;
      normal = {
        family = "SF Mono Nerd";
        style = "Regular";
      };
      bold = {
        family = "SF Mono Nerd";
        style = "Bold";
      };
      italic = {
        family = "SF Mono Nerd";
        style = "Italic";
      };
      bold_italic = {
        family = "SF Mono Nerd";
        style = "Bold Italic";
      };
    };
    window.dimentions = {
      columns = 120;
      lines = 50;
    };
    bell = {
      animation = "EaseOutExpo";
      duration = 1;
    };
    cursor = {
      style.blinking = "Always";
      blink_interval = 800;
    };
    colors = {
      # Default colors
      primary = {
        background = "0x1d2021";
        foreground = "0xd4be98";
      };

      # Colors the cursor will use if `custom_cursor_colors` is true

      # Normal colors
      normal = {
        black = "0x32302f"; # 0
        red = "0xea6962"; # 1
        green = "0xa9b665"; # 2
        yellow = "0xd8a657"; # 3
        blue = "0x7daea3"; # 4
        magenta = "0xd3869b"; # 5
        cyan = "0x89b482"; # 6
        white = "0xd4be98"; # 7
      };

      # Bright colors
      bright = {
        black = "0x32302f"; # 8
        red = "0xea6962"; # 9
        green = "0xa9b665"; #10
        yellow = "0xd8a657"; #11
        blue = "0x7daea3"; #12
        magenta = "0xd3869b"; #13
        cyan = "0x89b482"; #14
        white = "0xd4be98"; #15
      };
    };
  };
}
