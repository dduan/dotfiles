{
  inputs = {
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
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
                    })
                ];
                inherit system;
              };
            };
        };
    in
    with import ./lib; {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dan"; host = "mbp.local"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "the-puter"; arch = arch.x86_64; os = os.linux; })
        (mkConfig { username = "dan"; host = "dduan.local"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "dduan.lan"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "imac.local"; arch = arch.x86_64; os = os.darwin; })
        (mkConfig { username = "dan"; host = "nixos"; arch = arch.aarch64; os = os.linux; })
      ];
    };
}
