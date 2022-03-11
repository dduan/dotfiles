{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager }:
    let
      mkConfig = { username ? "dan", host, arch, os }:
        let isDarwin = os == "darwin"; in
        {
          name = "${username}@${host}";
          value = home-manager.lib.homeManagerConfiguration {
            inherit username;
            system = "${arch}-${os}";
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
