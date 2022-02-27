{ vimPlugins, ripgrep, nixpkgs-fmt }:
{
  enable = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = with vimPlugins; [
    ack-vim
    auto-pairs
    molokai
    nerdcommenter
    nerdtree
    nvim-compe
    nvim-lspconfig
    rust-vim
    swift-vim
    vim-airline
    vim-better-whitespace
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
  extraConfig = builtins.readFile ./vim/init.vim;
}
