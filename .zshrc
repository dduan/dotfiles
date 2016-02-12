# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export PATH="$HOME/bin:$HOME/.tmuxifier/bin:/usr/local/bin:/usr/local/sbin:$PATH"
alias vim='mvim'
alias vi='vim'

bindkey -v
bindkey '^r' history-incremental-search-backward

eval "$(pyenv init -)"

export EDITOR="vim"
export WORKON_HOME=$HOME/workspace/venv
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/workspace/go

alias :q="exit"
alias :e="$EDITOR"
alias swift="xcrun swift"

alias SW=$HOME/swift/build/Ninja-ReleaseAssert/swift-macosx-x86_64/bin/swift
alias SWC=$HOME/swift/build/Ninja-ReleaseAssert/swift-macosx-x86_64/bin/swiftc

alias remote_db="ssh -fNg -L 3307:127.0.0.1:3306 -p 19249 duan@50.201.94.186"
alias cel='deactivate; source /Users/drchrono/workspace/venv/drchrono-web/bin/activate; cd /Users/drchrono/drchrono/web; ./manage.py celery worker -l INFO -Q celery,fast,bulk --soft-time-limit=15 --time-limit=20 --maxtasksperchild=1'
alias drweb='deactivate; source /Users/drchrono/workspace/venv/drchrono-web/bin/activate; cd /Users/drchrono/drchrono/web; ./manage.py runserver 8080'
alias gitclean="git clean -d -x -f"

if [ -n "$INSIDE_EMACS" ]; then
    chpwd() { print -P "\033AnSiTc %d" }
    print -P "\033AnSiTu %n"
    print -P "\033AnSiTc %d"
fi

