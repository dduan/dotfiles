if command git diff --cached --no-ext-diff --quiet --exit-code 2> /dev/null
  return 1
end
git_is_repo
