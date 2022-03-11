set -l color  $argv[1]
set -l string $argv[2]
set_color $color
printf $string
set_color normal
