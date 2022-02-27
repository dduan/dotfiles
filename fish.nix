{ fetchFromGitHub, tag, fd }:
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

  functions = {
    fzf_file_widget = ''
      # Store current token in $dir as root for the 'find' command
      set -l dir (commandline -t)
      # The commandline token might be escaped, we need to unescape it.
      set dir (eval "printf '%s' $dir")
      if [ ! -d "$dir" ]
        set dir .
      end
      # Some 'find' versions print undesired duplicated slashes if the path ends with slashes.
      set dir (string replace --regex '(.)/+$' '$1' "$dir")

      # "-path \$dir'*/\\.*'" matches hidden files/folders inside $dir but not
      # $dir itself, even if hidden.
      set -q FZF_CTRL_T_COMMAND; or set -l FZF_CTRL_T_COMMAND "
      command find -L \$dir -mindepth 1 \\( -path \$dir'*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' \\) -prune \
      -o -type f -print \
      -o -type d -print \
      -o -type l -print 2> /dev/null | cut -b3-"

      set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
      begin
        set -lx FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT --reverse $FZF_DEFAULT_OPTS $FZF_CTRL_T_OPTS"
        eval "$FZF_CTRL_T_COMMAND | "(__fzfcmd)" -m" | while read -l r; set result $result $r; end
      end
      if [ -z "$result" ]
        commandline -f repaint
        return
      end

      if [ "$dir" != . ]
        # Remove last token from commandline.
        commandline -t ""
      end
      for i in $result
        commandline -it -- (string escape $i)
        commandline -it -- ' '
      end
      commandline -f repaint

      function __fzfcmd
        set -q FZF_TMUX; or set FZF_TMUX 0
        set -q FZF_TMUX_HEIGHT; or set FZF_TMUX_HEIGHT 40%
        if [ $FZF_TMUX -eq 1 ]
          echo "fzf-tmux -d$FZF_TMUX_HEIGHT"
        else
          echo "fzf"
        end
      end
    '';

    tag = ''
      command ${tag}/bin/tag $argv; and source /tmp/tag_aliases &> /dev/null
    '';

    tre = ''
      command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null
    '';

    key_binds = ''
      fish_vi_key_bindings
      bind -M insert \cp fzf_file_widget
      for mode in insert default visual
          bind -M $mode \cf forward-char
      end
      bind -M insert -m default \cc backward-char force-repaint
    '';

    git_branch_name = ''
      set -l branch_name (command git symbolic-ref --short HEAD 2> /dev/null)
      if test -z "$branch_name"
        set -l tag_name (command git describe --tags --exact-match HEAD 2> /dev/null)
        if test -z "$tag_name"
          command git rev-parse --short HEAD 2> /dev/null
        else
          printf "%s\n" "$tag_name"
        end
      else
        printf "%s\n" "$branch_name"
      end
    '';

    git_is_dirty = ''
      if command git diff --no-ext-diff --quiet --exit-code 2> /dev/null
        return 1
      end
      git_is_repo
    '';

    git_is_repo = ''
      if not command git rev-parse --git-dir &> /dev/null
        return 1
      end
    '';

    git_is_staged = ''
      if command git diff --cached --no-ext-diff --quiet --exit-code 2> /dev/null
        return 1
      end
      git_is_repo
    '';

    git_is_touched = ''
      if not git_is_repo
        return 1
      end
      command git status --porcelain 2> /dev/null | command awk '
        // {
          z++
          exit 0
        }
        END {
          exit !z
        }
      '
    '';

    __git_upstream_configured = ''
      git rev-parse --abbrev-ref @"{u}" > /dev/null 2>&1
    '';

    __print_color = ''
      set -l color  $argv[1]
      set -l string $argv[2]
      set_color $color
      printf $string
      set_color normal
    '';

    fish_prompt = ''
      echo -e ""

      # User
      #
      set -l user (id -un $USER)
      __print_color F4ADA9 "$user"


      # Host
      #
      set -l host_name (hostname -s)
      set -l host_glyph " at "

      __print_color ffffff "$host_glyph"
      __print_color F6F49D "$host_name"

      set -l nix_shell_info (
        if test -n "$IN_NIX_SHELL"
          echo -n " (nix-shell)"
        end
      )

      __print_color 00AA00 "$nix_shell_info"


      # Current working directory
      #
      set -l pwd_glyph " in "
      set -l pwd_string (echo $PWD | sed 's|^'$HOME'\(.*\)$|~\1|')

      __print_color ffffff "$pwd_glyph"
      __print_color B2E6EA "$pwd_string"


      # Git
      #
      if git_is_repo
          set -l branch_name (git_branch_name)
          set -l git_glyph " on "
          set -l git_branch_glyph

          __print_color ffffff "$git_glyph"
          __print_color 9AB6F9 "$branch_name"

          if git_is_touched
              if git_is_staged
                  if git_is_dirty
                      set git_branch_glyph " [±]"
                  else
                      set git_branch_glyph " [+]"
                  end
              else
                  set git_branch_glyph " [?]"
              end
          end

          __print_color 9AB6F9 "$git_branch_glyph"

          if __git_upstream_configured
               set -l git_ahead (command git rev-list --left-right --count HEAD...@"{u}" 2> /dev/null | awk '
                  $1 > 0 { printf("⇡") } # can push
                  $2 > 0 { printf("⇣") } # can pull
               ')

               if test ! -z "$git_ahead"
                  __print_color B2E6EA " $git_ahead"
              end
          end
      end

      __print_color F4ADA9 "\e[K\n❯ "
    '';

    fish_mode_prompt = "";
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

    set fish_greeting
    set fish_key_bindings key_binds

    # FZF
    # TODO: Home manager's fzf module didn't work.
    export FZF_DEFAULT_COMMAND="${fd}/bin/fd --type f --hidden --exclude .git"
    export FZF_DEFAULT_OPTS="--height 37.5% --reverse --preview 'file {}' --preview-window down:1"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  '';
}
