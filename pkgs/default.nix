{ pkgs }:
{
  tag = pkgs.callPackage ./tag { };
  sf-mono-font = pkgs.callPackage ./sf-mono-font { };
}
