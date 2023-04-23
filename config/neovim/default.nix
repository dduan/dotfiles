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
    nvim-treesitter.withAllGrammars
    nvim-web-devicons
    telescope-nvim
    vim-airline
    vim-better-whitespace
    vim-easy-align
    vim-fugitive
    vim-gitgutter
    vim-highlightedyank
    vim-rhubarb
    vim-tmux-navigator
  ];
  extraLuaConfig = builtins.readFile ./init.lua;
}
