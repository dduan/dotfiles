{ lib, vimPlugins, pkgs, pkgs-unstable, ... }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  package = pkgs-unstable.neovim-unwrapped;
  plugins = with vimPlugins; [
    asyncrun-vim
    barbar-nvim
    cmp-nvim-lsp
    cmp-vsnip
    copilot-vim
    editorconfig-vim
    emmet-vim
    gitsigns-nvim
    gruvbox-nvim
    lualine-nvim
    lspkind-nvim
    nerdcommenter
    nvim-autopairs
    nvim-cmp
    nvim-lspconfig
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
    ./FileTypes/go.lua
    ./appearance.lua
    ./keymaps.lua
    ./lsp.lua
  ]);
}
