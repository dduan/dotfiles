{ vimPlugins, ripgrep }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
    ack-vim
    auto-pairs
    emmet-vim
    fzf-vim
    molokai
    nerdcommenter
    nvim-compe
    nvim-lspconfig
    nvim-tree-lua
    nvim-web-devicons
    rust-vim
    swift-vim
    vim-airline
    vim-better-whitespace
    vim-easy-align
    vim-fish
    vim-fugitive
    vim-gitgutter
    vim-go
    vim-highlightedyank
    vim-markdown
    vim-nix
    vim-rhubarb
    vim-tmux-navigator
    vim-toml
    zig-vim
  ];
  extraConfig = import ./config.vim { inherit ripgrep; };
}
