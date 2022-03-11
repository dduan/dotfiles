let keyValueAttrs = values: builtins.listToAttrs (map (v: { name = v; value = v; }) values); in
{
  callPackages = pkgs: path: overrides:
    let
      localPackages = import ../pkgs { inherit pkgs; };
      f = import path;
    in
    f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
  os = keyValueAttrs [ "darwin" "linux" ];
  arch = keyValueAttrs [ "aarch64" "x86_64" ];
}
