{ lib, vimPlugins }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
    cmp-buffer
    cmp-cmdline
    cmp-nvim-lsp
    cmp-path
    cmp-vsnip
    copilot-vim
    editorconfig-vim
    emmet-vim
    gitsigns-nvim
    gruvbox-nvim
    lightline-lsp
    lightline-vim
    lspkind-nvim
    nerdcommenter
    nvim-autopairs
    nvim-cmp
    nvim-lspconfig
    nvim-tree-lua
    nvim-web-devicons
    swift-vim
    telescope-nvim
    trouble-nvim
    venn-nvim
    vim-better-whitespace
    vim-easy-align
    vim-fugitive
    vim-highlightedyank
    vim-markdown
    vim-rhubarb
    vim-slime
    vim-tmux-navigator
    vim-vsnip
    (nvim-treesitter.withPlugins (plugins: with plugins; [
      bash
      c
      cmake
      cpp
      css
      diff
      dockerfile
      dot
      fish
      gitattributes
      gitignore
      git_rebase
      go
      haskell
      html
      javascript
      json
      json5
      kotlin
      latex
      lua
      make
      nix
      perl
      proto
      python
      rst
      rust
      scheme
      solidity
      sql
      swift
      toml
      typescript
      vim
      yaml
      zig
    ]))
  ];
  extraLuaConfig = lib.concatStrings (map builtins.readFile [
    ./init.lua
    ./Plugins/autopairs.lua
    ./Plugins/lightline.lua
    ./Plugins/nerdcommenter.lua
    ./Plugins/slime.lua
    ./Plugins/telescope.lua
    ./Plugins/tree.lua
    ./Plugins/trouble.lua
    ./Plugins/venn.lua
    ./FileTypes/markdown.lua
    ./FileTypes/nix.lua
    ./FileTypes/rust.lua
    ./FileTypes/swift.lua
    ./appearance.lua
    ./lsp.lua
    ./keymaps.lua
  ]);
}
