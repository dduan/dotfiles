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
      size = 15.0;
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
  };
}
