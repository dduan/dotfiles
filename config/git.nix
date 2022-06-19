{}:
{
  enable = true;
  userName = "Daniel Duan";
  userEmail = "daniel@duan.ca";
  extraConfig = {
    advice.skippedCherryPicks = false;
    branch.main.pushRemote = "NOPE";
    color.ui = true;
    core.editor = "nvim";
    init.defaultBranch = "main";
    pull.rebase = true;
    rerere.enabled = true;
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
