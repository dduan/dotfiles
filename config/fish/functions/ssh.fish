if set -q KITTY_WINDOW_ID
    command kitty +kitten ssh $argv
else
    command ssh $argv
end

