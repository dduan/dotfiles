{}:
{
  enable = true;
  settings = {
    user = {
      name = "Daniel Duan";
      email = "daniel@duan.ca";
    };
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
    diff.external = "difft --display inline";
  };
  ignores = [
    ".DS_Store"
    "*.pyc"
    ".envrc"
    ".direnv"
    ".ide_lint_disabled"
  ];
}
