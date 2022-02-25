{
  enable = true;
  shortcut = "a";
  baseIndex = 1;
  keyMode = "vi";
  extraConfig = ''

    # Smart pane switching with awareness of Vim splits.
    # See: https://github.com/christoomey/vim-tmux-navigator
    is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
        | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
    bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
    bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
    bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
    bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
    bind-key -T copy-mode-vi 'C-h' select-pane -L
    bind-key -T copy-mode-vi 'C-j' select-pane -D
    bind-key -T copy-mode-vi 'C-k' select-pane -U
    bind-key -T copy-mode-vi 'C-l' select-pane -R

    # split pane should stay in the same directory
    bind '"' split-window -c "#{pane_current_path}"
    bind % split-window -h -c "#{pane_current_path}"
    bind c new-window -c "#{pane_current_path}"
    set-option -g mouse on
    set-window-option -g window-status-current-format '#[bg=white,fg=black,bold]#I:#W#[fg=dim]#F'
    set -g status-justify left
    set -g status-bg colour235
    set -g status-fg colour12
    set -g status-right \'\'
    set -g status-interval 2
    set-option -g status-position top
    setw -g aggressive-resize on
    unbind p
    bind p paste-buffer

    # Use vim keybindings in copy mode
    set-window-option -g mode-keys vi
    # Setup 'v' to begin selection as in Vim
    bind-key -T copy-mode-vi v send -X begin-selection
  '';
}
