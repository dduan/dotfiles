
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

export FZF_DEFAULT_COMMAND='rg --files -S --no-ignore --hidden --follow --glob "!tags" --glob "!.git/*" --glob "!build/"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

if status --is-login
    set -x PATH $PATH ~/bin
end

function fish_mode_prompt; end

set PATH /usr/local/bin /Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin $PATH

alias vim="mvim -v"
