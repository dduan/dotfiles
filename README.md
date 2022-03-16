# Daniel Duan's Dotfiles managed by Home Manager

These are dotfiles for stand-alone home-manager.

## Assumptions

These are things not managed by home-manager. They should exist somehow.

- An OS-provided Alacritty
- Nix with flake support

## Usage

Having prepare the OS for the assumptions detailed above: 
1. put content of this directory in `$HOME/.config/nixpkgs`.
2. run `make switch`, following instructions of output if necessary.
