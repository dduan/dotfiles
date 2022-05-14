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
    nerdtree
    nvim-compe
    nvim-lspconfig
    rust-vim
    swift-vim
    vim-airline
    vim-better-whitespace
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
  ];
  extraConfig = import ./config.vim { inherit ripgrep; };
}
