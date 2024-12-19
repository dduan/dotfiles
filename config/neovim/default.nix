{ lib, vimPlugins, pkgs, pkgs-unstable, ... }:
let
  localPackages = import ../../pkgs { inherit pkgs; };
  templ-vim = pkgs.vimUtils.buildVimPlugin {
    pname = "templ-vim";
    version = "2023-10-30";
    src = pkgs.fetchFromGitHub {
      owner = "joerdav";
      repo = "templ.vim";
      rev = "5cc48b93a4538adca0003c4bc27af844bb16ba24";
      sha256 = "sha256-YdV8ioQJ10/HEtKQy1lHB4Tg9GNKkB0ME8CV/+hlgYs=";
    };
  };
in
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  package = pkgs-unstable.neovim-unwrapped;
  plugins = with vimPlugins; [
    asyncrun-vim
    cmp-nvim-lsp
    cmp-vsnip
    copilot-vim
    editorconfig-vim
    emmet-vim
    gitsigns-nvim
    gruvbox-nvim
    lspkind-nvim
    lualine-nvim
    nerdcommenter
    nvim-autopairs
    nvim-cmp
    nvim-lspconfig
    nvim-web-devicons
    oil-nvim
    pkgs-unstable.vimPlugins.barbar-nvim
    telescope-nvim
    templ-vim
    vim-better-whitespace
    vim-fugitive
    vim-highlightedyank
    vim-markdown
    vim-tmux-navigator
    zig-vim
  ];
  extraLuaConfig = lib.concatStrings (map builtins.readFile [
    ./init.lua
    ./lib.lua
    ./Plugins/autopairs.lua
    ./Plugins/barbar.lua
    ./Plugins/statusline.lua
    ./Plugins/nerdcommenter.lua
    ./Plugins/telescope.lua
    ./Plugins/oil.lua
    ./FileTypes/gitcommit.lua
    ./FileTypes/go.lua
    ./FileTypes/markdown.lua
    ./FileTypes/nix.lua
    ./FileTypes/rust.lua
    ./FileTypes/swift.lua
    ./FileTypes/templ.lua
    ./appearance.lua
    ./keymaps.lua
    ./lsp.lua
  ]);
}
