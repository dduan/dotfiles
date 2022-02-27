{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager }:
    let
      mkConfig = { username, host, os }:
        let isDarwin = (builtins.elemAt (builtins.split "-" os) 2) == "darwin"; in
        {
          name = "${username}@${host}";
          value = home-manager.lib.homeManagerConfiguration {
            inherit username;
            system = os;
            configuration = { config, pkgs, ... }:
              let
                localPackages = import ./pkgs {
                  inherit pkgs;
                };
                callPackages = path: overrides:
                  let f = import path;
                  in f ((builtins.intersectAttrs (builtins.functionArgs f) (pkgs // localPackages)) // overrides);
              in
              {
                home = {
                  packages = with pkgs; [
                    bat
                    fd
                    nixpkgs-fmt
                    ripgrep
                    tig
                    tre-command
                  ];
                };
                news.display = "silent";
                xdg.configFile."nix/nix.conf".text = "experimental-features = nix-command flakes";
                programs = rec {
                  # Home manager manages itself.
                  home-manager.enable = true;

                  # Program-specific configs.
                  alacritty = callPackages ./alacritty.nix { };
                  fish = callPackages ./fish.nix { };
                  git = callPackages ./git.nix { };
                  neovim = callPackages ./neovim { };
                  tmux =
                    if isDarwin
                    then callPackages ./tmux/tmux-darwin.nix { }
                    else callPackages ./tmux/tmux-linux.nix { };
                };
              };
            homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
          };
        };
    in
    {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dduan"; host = "dduan-mbp184"; os = "aarch64-darwin"; })
        (mkConfig { username = "dan"; host = "the-puter"; os = "x86_64-linux"; })
      ];
    };
}
