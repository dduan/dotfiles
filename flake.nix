{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    tre-command.url = "github:dduan/tre";
  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, tre-command }:
    let
      mkConfig = { username ? "dan", host, arch, os }:
        let
          isDarwin = os == "darwin";
          system = "${arch}-${os}";
        in
        {
          name = "${username}@${host}";
          value = home-manager.lib.homeManagerConfiguration {
            inherit username system;
            extraModules = [
              ({ pkgs, ... }: {
                _module.args.extraPkgs = {
                  nixpkgs-unstable = import nixpkgs-unstable { inherit system; };
                  tre-command = tre-command.defaultPackage.${system};
                };
              })
            ];
            configuration = if isDarwin then import ./config/home/darwin.nix else ./config/home/linux.nix;
            homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
          };
        };
    in
    with import ./lib; {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dduan"; host = "dduan-mbp184"; arch = arch.aarch64; os = os.darwin; })
        (mkConfig { host = "the-puter"; arch = arch.x86_64; os = os.linux; })
        (mkConfig { host = "imac.local"; arch = arch.x86_64; os = os.darwin; })
        (mkConfig { host = "nixos"; arch = arch.aarch64; os = os.linux; })
      ];
    };
}
