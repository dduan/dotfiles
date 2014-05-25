#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/.tmuxifier/bin:$HOME/Library/python/2.7/bin:/usr/local/bin:/usr/local/sbin:$PATH"
alias vim='mvim -v'

bindkey -v
bindkey '^R' history-incremental-search-backward

eval "$(pyenv init -)"
eval "$(tmuxifier init -)"

alias cel="./manage.py celery worker --autoload -l INFO -Q celery,fast"
alias :q="exit"
alias mux="tmuxifier load-session"

export EDITOR="vim"
