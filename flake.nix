{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    home-manager.url = "github:nix-community/home-manager/release-21.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager }:
    let
      mkConfig = { username ? "dan", host, os }:
        let isDarwin = (builtins.elemAt (builtins.split "-" os) 2) == "darwin"; in
        {
          name = "${username}@${host}";
          value = home-manager.lib.homeManagerConfiguration {
            inherit username;
            system = os;
            configuration = import ./home.nix isDarwin;
            homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
          };
        };
    in
    {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dduan"; host = "dduan-mbp184"; os = "aarch64-darwin"; })
        (mkConfig { host = "the-puter"; os = "x86_64-linux"; })
        (mkConfig { host = "imac.local"; os = "x86_64-darwin"; })
        (mkConfig { host = "nixos"; os = "aarch64-linux"; })
      ];
    };
}
