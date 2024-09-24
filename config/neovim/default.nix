{ lib, vimPlugins }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
    barbar-nvim
    copilot-vim
    editorconfig-vim
    gitsigns-nvim
    gruvbox-nvim
    lualine-nvim
    nerdcommenter
    nvim-autopairs
    nvim-tree-lua
    nvim-web-devicons
    telescope-nvim
    vim-better-whitespace
    vim-fugitive
    vim-highlightedyank
    vim-markdown
    vim-tmux-navigator
    zig-vim
  ];
  extraLuaConfig = lib.concatStrings (map builtins.readFile [
    ./init.lua
    ./Plugins/autopairs.lua
    ./Plugins/barbar.lua
    ./Plugins/statusline.lua
    ./Plugins/nerdcommenter.lua
    ./Plugins/telescope.lua
    ./Plugins/tree.lua
    ./FileTypes/markdown.lua
    ./FileTypes/nix.lua
    ./FileTypes/rust.lua
    ./FileTypes/swift.lua
    ./FileTypes/gitcommit.lua
    ./appearance.lua
    ./keymaps.lua
  ]);
}
