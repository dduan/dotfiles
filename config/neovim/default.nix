{ vimPlugins }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
    ack-vim
    auto-pairs
    copilot-vim
    editorconfig-vim
    emmet-vim
    molokai
    nerdcommenter
    nvim-compe
    nvim-lspconfig
    nvim-tree-lua
    nvim-web-devicons
    rust-vim
    swift-vim
    telescope-nvim
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
  extraLuaConfig = builtins.readFile ./init.lua;
}
