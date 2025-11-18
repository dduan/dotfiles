{}:
{
  enable = true;
  userName = "Daniel Duan";
  userEmail = "daniel@duan.ca";
  extraConfig = {
    advice.skippedCherryPicks = false;
    advice.detachedHead = false;
    branch = {
      main.pushRemote = "NOPE";
      sort = "-committerdate";
    };
    color.ui = true;
    core = {
      commentChar = ";";
      editor = "nvim";
    };
    fetch = {
      fsckobjects = true;
      prune = true;
      prunetags = true;
    };
    init.defaultBranch = "main";
    pull.rebase = true;
    receive.fsckobjects = true;
    rerere.enabled = true;
    transfer.fsckobjects = true;
    diff.algorithm = "histogram";
  };
  ignores = [
    ".DS_Store"
    "*.pyc"
    ".envrc"
    ".direnv"
    ".ide_lint_disabled"
  ];
  delta = {
    enable = true;
    options = {
      navigate = true;
      line-numbers = true;
    };
  };
}
