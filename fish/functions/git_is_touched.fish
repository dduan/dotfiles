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
