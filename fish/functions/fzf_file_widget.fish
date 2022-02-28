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
