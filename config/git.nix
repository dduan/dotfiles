{}:
{
  enable = true;
  userName = "Daniel Duan";
  userEmail = "daniel@duan.ca";
  extraConfig = {
    core.editor = "nvim";
    color.ui = true;
    pull.ff = "only";
    init.defaultBranch = "main";
  };
  ignores = [
    ".DS_Store"
    "*.pyc"
    ".envrc"
    ".direnv"
  ];
  delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
      syntax-theme = "github";
    };
  };
}
