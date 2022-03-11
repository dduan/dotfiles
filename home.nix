isDarwin:
{ config, pkgs, ... }:
let
  localPackages = import ./pkgs {
    inherit pkgs;
  };
  callPackages = path: overrides:
    let f = import path;
    in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
in
{
  home.packages = with pkgs; [
    bat
    fd
    fzf
    gnumake
    htop
    librsvg
    nixpkgs-fmt
    ripgrep
    tig
    tre-command
    wget
  ] ++ (lib.lists.optionals (!isDarwin) [
    localPackages.apple-fonts.SF-Mono
    localPackages.apple-fonts.SF-Pro
    xclip
  ]);
  news.display = "silent";
  xdg.configFile."nix/nix.conf".text = "experimental-features = nix-command flakes";
  fonts.fontconfig.enable = true;
  programs = rec {
    # Home manager manages itself.
    home-manager.enable = true;

    # Program-specific configs.
    alacritty = callPackages ./alacritty.nix { };
    fish = callPackages ./fish { };
    git = callPackages ./git.nix { };
    neovim = callPackages ./neovim { };
    tmux =
      if isDarwin
      then callPackages ./tmux/tmux-darwin.nix { }
      else callPackages ./tmux/tmux-linux.nix { };
  } // (pkgs.lib.attrsets.optionalAttrs (!isDarwin) {
    i3status = callPackages ./i3status.nix { };
    rofi = callPackages ./rofi.nix { };
  });
  xsession.windowManager = (pkgs.lib.attrsets.optionalAttrs (!isDarwin)) {
    i3 = callPackages ./i3.nix { };
  };
}
