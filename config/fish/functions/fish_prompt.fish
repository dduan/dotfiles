echo -e ""

# User
#
set -l user (id -un $USER)
__print_color FB4934 "$user"


# Host
#
set -l host_name (hostname -s)
set -l host_glyph " at "

__print_color EBDBB2 "$host_glyph"
__print_color D79921 "$host_name"

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

__print_color EBDBB2 "$pwd_glyph"
__print_color 458588 "$pwd_string"


# Git
#
if git_is_repo
    set -l branch_name (git_branch_name)
    set -l git_glyph " on "
    set -l git_branch_glyph

    __print_color EBDBB2 "$git_glyph"
    __print_color 83A598 "$branch_name"

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

    __print_color 83A598 "$git_branch_glyph"

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
