# Daniel Duan's Dotfiles managed by Home Manager

These are dotfiles for macOS and non-NixOS Linux. They may work on NixOS as well but I'm not using them that way yet.

## Assumptions

These are things not managed by home-manager. They should exist somehow.

- An OS-provided Alacritty
- An OS-provided SF Mono font
- Multi-user installation of Nix with flake support

## Usage

Having prepare the OS for the assumptions detailed above: 
1. put content of this repo in `$HOME/.config/nixpkgs`.
2. run `home-manager switch`, following instructions of output if necessary.
