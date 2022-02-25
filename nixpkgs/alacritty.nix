{ fish }:
{
  enable = true;
  settings = {
    dpi = {
      x = 120;
      y = 120;
    };
    env.TERM = "xterm-256color";
    shell = {
      program = "${fish}/bin/fish";
      args = [
        "--login"
        "--command=tmux attach || tmux"
      ];
    };
    font = {
      size = 13.0;
      use_thin_strokes = true;
    };
    window.dimentions = {
      columns = 120;
      lines = 50;
    };
  };
}
