{ fetchFromGitHub }:
{
  enable = true;
  plugins = [{
    name = "foreign-env";
    src = fetchFromGitHub {
      owner = "oh-my-fish";
      repo = "plugin-foreign-env";
      rev = "dddd9213272a0ab848d474d0cbde12ad034e65bc";
      sha256 = "00xqlyl3lffc5l0viin1nyp819wf81fncqyz87jx8ljjdhilmgbs";
    };
  }];

  shellInit =
    ''
      # nix
      if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
          fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
      end

      # home-manager
      if test -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
         fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
      end
    '';
}
