fish_vi_key_bindings
bind -M insert \cp fzf_file_widget
for mode in insert default visual
    bind -M $mode \cf forward-char
end
bind -M insert -m default \cc backward-char force-repaint
