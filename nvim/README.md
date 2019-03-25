## Use [vim-plug][] as plugin manager.

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

[vim-plug]: https://github.com/junegunn/vim-plug


## Interacting with tmux

Use these settings in conjuction with `christoomey/vim-tmux-navigator` in .tmux.conf
```
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"
```

## Install fzf

```
https://github.com/junegunn/fzf
```

## Install ripgrep (rg)

```
https://github.com/BurntSushi/ripgrep
```

## Install sourcekit-lsp

```
https://github.com/apple/sourcekit-lsp
```

## Install pynvim
```
python3 -m pip install pynvim
```
