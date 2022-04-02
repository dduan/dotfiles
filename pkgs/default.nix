{ pkgs }:
{
  tag = pkgs.callPackage ./tag { };
  sf-mono-ligaturized = pkgs.callPackage ./sf-mono-ligaturized { };
  apple-fonts = pkgs.callPackage ./apple-fonts { };
}
