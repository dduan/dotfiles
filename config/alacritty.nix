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
      use_thin_strokes = true;
      normal = {
        family = "SF Mono";
        style = "Regular";
      };
      bold = {
        family = "SF Mono";
        style = "Bold";
      };
      italic = {
        family = "SF Mono";
        style = "Italic";
      };
      bold_italic = {
        family = "SF Mono";
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
      blink_interval = 500;
    };
    colors = {
      # Default colors
      primary = {
        background = "0x212121";
        foreground = "0xdcdccc";
      };

      # Colors the cursor will use if `custom_cursor_colors` is true

      # Normal colors
      normal = {
        black = "0x4d4d4d"; # 0
        red = "0xfb2573"; # 1
        green = "0x98e123"; # 2
        yellow = "0xeedfb5"; # 3
        blue = "0x45a9d0"; # 4
        magenta = "0xd190c0"; # 5
        cyan = "0x1070b0"; # 6
        white = "0xdcdbcd"; # 7
      };

      # Bright colors
      bright = {
        black = "0x768f81"; # 8
        red = "0x999999"; # 9
        green = "0xc2bfa2"; #10
        yellow = "0xddcfa4"; #11
        blue = "0x9dbdee"; #12
        magenta = "0xe097d0"; #13
        cyan = "0xa4dee2"; #14
        white = "0xffffff"; #15
      };
    };
  };
}
