{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    tre-command.url = "github:dduan/tre";
    ea.url = "github:dduan/ea";
    templ.url = "github:a-h/templ";
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
                  inputs.templ.overlays.default
                  (final: prev:
                    {
                      tre-command = inputs.tre-command.defaultPackage.${system};
                      ea = inputs.ea.defaultPackage.${system};
                      neovim-nightly = inputs.neovim-nightly-overlay.packages.default;
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
        (mkConfig { username = "dan"; host = "mac2.local"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "the-puter"; arch = arch.x86_64; os = os.linux; })
        (mkConfig { username = "dan"; host = "imac.local"; arch = arch.x86_64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "nixos"; arch = arch.aarch64; os = os.linux; })
      ];
    };
}
