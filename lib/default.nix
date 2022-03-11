{ pkgs }:
let
  localPackages = import ../pkgs {
    inherit pkgs;
  };
in
{
  callPackages = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
}
