{ pkgs }:
{
  tag = pkgs.callPackage ./tag { };
  sf-mono-font = pkgs.callPackage ./sf-mono-font { };
  apple-fonts = pkgs.callPackage ./apple-fonts { };
}
