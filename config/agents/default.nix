{ config, lib, ... }:
let
  agents = "${config.home.homeDirectory}/.agents";
  overlay = "${agents}/AGENTS.local.md";

  instructions =
    builtins.readFile ./AGENTS.md
    + lib.optionalString (builtins.pathExists overlay)
      ("\n" + builtins.readFile overlay);

  canonical = config.lib.file.mkOutOfStoreSymlink "${agents}/AGENTS.md";
in
{
  home.file = {
    ".agents/AGENTS.md".text = instructions;
    ".pi/agent/AGENTS.md".source = canonical;
    ".claude/CLAUDE.md".source = canonical;
  };
}
