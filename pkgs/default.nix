{ pkgs }:
{
  sf-mono-ligaturized = pkgs.callPackage ./sf-mono-ligaturized { };
  apple-fonts = pkgs.callPackage ./apple-fonts { };
  git-pile = pkgs.callPackage ./git-pile { };
}
