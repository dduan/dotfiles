{ lib, vimPlugins }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
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
  extraLuaConfig = lib.concatStrings (map builtins.readFile [
    ./init.lua
    ./appearance.lua
    ./lsp.lua
    ./tree.lua
    ./keymaps.lua
  ]);
}
