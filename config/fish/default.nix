{ fetchFromGitHub, tag, fd, direnv }:
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

  # Read file list from ./functions folder. Use xxx.fish to generate "xxx = readFile ./functions/xxx.fish"
  functions =
    with builtins;
    listToAttrs
      (map
        (f: { name = f; value = readFile ./functions/${f}.fish; })
        (map
          (f: elemAt (split "\\." f) 0)
          (attrNames (readDir ./functions))))
    // {
      tag = import ./functions/tag.fish { inherit tag; };
    };


  shellAliases = {
    fd = "tag fd";
    find = "tag find";
    rg = "tag rg";
  };

  shellInit = ''
    # nix
    if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
    end

    # home-manager
    if test -e $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
       fenv source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    end

    ${direnv}/bin/direnv hook fish | source

    set fish_greeting
    set fish_key_bindings key_binds

    export EDITOR="vim"

    # FZF
    # TODO: Home manager's fzf module didn't work.
    export FZF_DEFAULT_COMMAND="${fd}/bin/fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS="--height 37.5% --reverse --preview 'file {}' --preview-window down:1"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    fish_add_path $HOME/.local/bin
    fish_add_path /opt/homebrew/bin

    set -gx SWIFTENV_ROOT "$HOME/.swiftenv"
    fish_add_path "$SWIFTENV_ROOT/bin"
    fish_add_path "$SWIFTENV_ROOT/shims"

  '';
}
