{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    tre-command.url = "github:dduan/tre";
    ea.url = "github:dduan/ea";
  };
  outputs = { self, home-manager, ... }@inputs:
    let
      mkConfig = { host, arch, os }:
        let
          isDarwin = os == "darwin";
          system = "${arch}-${os}";
        in
        {
          name = "dan@${host}";
          value = home-manager.lib.homeManagerConfiguration {
            inherit system;
            username = "dan";
            configuration = if isDarwin then import ./config/home/darwin.nix else ./config/home/linux.nix;
            homeDirectory = if isDarwin then "/Users/dan" else "/home/dan";
            pkgs = import inputs.nixpkgs {
              overlays = [
                (final: prev:
                  {
                    tre-command = inputs.tre-command.defaultPackage.${system};
                    ea = inputs.ea.defaultPackage.${system};
                  })
              ];
              inherit system;
            };
          };
        };
    in
    with import ./lib; {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { host = "the-puter"; arch = arch.x86_64; os = os.linux; })
        (mkConfig { host = "dduan.local"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { host = "imac.local"; arch = arch.x86_64; os = os.darwin; })
        (mkConfig { host = "nixos"; arch = arch.aarch64; os = os.linux; })
      ];
    };
}
