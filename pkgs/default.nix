{ pkgs }:
{
  apple-fonts = pkgs.callPackage ./apple-fonts { };
  git-pile = pkgs.callPackage ./git-pile { };
  sf-mono-nerd = pkgs.callPackage ./sf-mono-nerd { };
}
