{ pkgs }:
{
  templ-vim = pkgs.callPackage ./templ-vim { };
  sf-mono-nerd = pkgs.callPackage ./sf-mono-nerd { };
  apple-fonts = pkgs.callPackage ./apple-fonts { };
  git-pile = pkgs.callPackage ./git-pile { };
}
