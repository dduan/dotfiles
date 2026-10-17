{ config, pkgs, pkgsUnstable, ... }:
import ./common.nix { inherit pkgs; } // {
  imports = [ ../agents ];
  home =
    {
      file = {
        ".config/tig/config".source = ../tig_config_darwin;
      };
      activation.rectangleConfig = config.lib.dag.entryAfter [ "writeBoundary" ] ''
        dir="$HOME/Library/Application Support/Rectangle"
        run mkdir -p "$dir"
        run rm -f "$dir/RectangleConfig.json"
        run install -m 644 ${../RectangleConfig.json} "$dir/RectangleConfig.json"
      '';
      packages = import ../packages/darwin.nix { inherit pkgs pkgsUnstable; };
    };
  programs = import ../programs/darwin.nix {
    inherit pkgs pkgsUnstable;
  };
}
