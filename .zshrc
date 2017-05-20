# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/bin:$HOME/.tmuxifier/bin:/usr/local/bin:/usr/local/sbin:$PATH"
alias vim='mvim -v'
alias ctags="`brew --prefix`/bin/ctags"

bindkey -v
bindkey '^r' history-incremental-search-backward

export EDITOR="vim"

alias :q="exit"
alias :e="$EDITOR"
alias swift="xcrun swift"

alias gitclean="git clean -d -x -f"

if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi
