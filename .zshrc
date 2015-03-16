# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/bin:$HOME/.tmuxifier/bin:/usr/local/bin:/usr/local/sbin:$PATH"
alias vim='mvim -v'
alias vi='vim'

bindkey -v
bindkey '^r' history-incremental-search-backward

eval "$(pyenv init -)"
eval "$(tmuxifier init -)"

export EDITOR="vim"
export WORKON_HOME=$HOME/workspace/venv
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/workspace/go

alias :q="exit"
alias :e="$EDITOR"
alias swift="DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer/ xcrun swift"

