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
    gitsigns-nvim
    molokai
    nerdcommenter
    nvim-compe
    nvim-lspconfig
    nvim-tree-lua
    nvim-web-devicons
    swift-vim
    telescope-nvim
    vim-airline
    vim-better-whitespace
    vim-easy-align
    vim-fugitive
    vim-highlightedyank
    vim-rhubarb
    vim-tmux-navigator
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
      markdown
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
    ./appearance.lua
    ./lsp.lua
    ./tree.lua
    ./keymaps.lua
  ]);
}
