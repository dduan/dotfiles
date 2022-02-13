function fish_user_key_bindings
    fish_vi_key_bindings
    fzf_key_bindings

    for mode in insert default visual
        bind -M $mode \cf forward-char
    end

    for mode in insert visual
        bind -M insert -m default \cc backward-char force-repaint
    end
end

set fish_key_bindings fish_user_key_bindings

export FZF_DEFAULT_COMMAND='/usr/bin/rg --files -S --hidden --follow --glob "!tags" --glob "!.git/*" --glob "!build/" --glob "!.build/" --glob "!.DS_Store" --glob "!build.noindex" --glob "!Pods" --glob "!deps" --glob "!bazel-ios" --glob "!.vscode" --glob "!.clangd"'
export FZF_DEFAULT_OPTS="--height 37.5% --reverse --preview 'file {}' --preview-window down:1"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

alias fd "tag fd"
alias rg "tag rg"

if status --is-login
    set -x PATH $PATH ~/bin
end

function fish_mode_prompt; end
set fish_greeting

alias vim "nvim"
set -x PATH $PATH $HOME/Code/wabt/out/clang/Release
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH $HOME/.local/bin
set -gx SWIFTENV_ROOT "$HOME/.swiftenv"
set -gx PATH "$SWIFTENV_ROOT/bin" $PATH
set -gx EDITOR vim
set -gx PATH "$HOME/Library/Haskell/bin" $PATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end
