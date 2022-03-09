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
            configuration = import ./home.nix isDarwin;
            homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";
          };
        };
    in
    {
      homeConfigurations = builtins.listToAttrs [
        (mkConfig { username = "dduan"; host = "dduan-mbp184"; os = "aarch64-darwin"; })
        (mkConfig { username = "dan"; host = "the-puter"; os = "x86_64-linux"; })
        (mkConfig { username = "dan"; host = "imac.local"; os = "x86_64-darwin"; })
      ];
    };
}
