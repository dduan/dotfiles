{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    tre-command.url = "github:dduan/tre";
    ea.url = "github:dduan/ea";
  };
  outputs = { self, home-manager, ... }@inputs:
    let
      mkConfig = { username, host, arch, os }:
        let
          isDarwin = os == "darwin";
          system = "${arch}-${os}";
        in
        {
          name = "${username}@${host}";
          value = home-manager.lib.homeManagerConfiguration
            {
              modules = [
                (if isDarwin then ./config/home/darwin.nix else ./config/home/linux.nix)
                {
                  home = {
                    inherit username;
                    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
                    stateVersion = "22.11";
                  };
                }
              ];
              pkgs = import inputs.nixpkgs {
                overlays = [
                  (final: prev:
                    {
                      tre-command = inputs.tre-command.defaultPackage.${system};
                      ea = inputs.ea.defaultPackage.${system};
                      neovim-nightly = inputs.neovim-nightly-overlay.packages.${system}.default;
                    })
                ];
                inherit system;
              };
              extraSpecialArgs = {
                pkgs-unstable = import inputs.nixpkgs-unstable {
                  inherit system;
                  config.allowUnfree = true;
                };
              };
            };
        };
    in
    with import
      ./lib; {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dan"; host = "mbp2.local"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "the-puter"; arch = arch.x86_64; os = os.linux; })
        (mkConfig { username = "dan"; host = "imac.local"; arch = arch.x86_64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "nixos"; arch = arch.aarch64; os = os.linux; })
      ];
    };
}
