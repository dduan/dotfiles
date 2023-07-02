# Daniel Duan's Dotfiles managed by Home Manager

These are dotfiles for stand-alone home-manager.

## Assumptions

These are things not managed by home-manager. They should exist somehow.

- Nix with flake support
- Alacritty installed NOT by nix, and its `terminfo`
- gh
- Some sort of `make` command with basic GNU Make compatibility

## Usage

Having prepare the OS for the assumptions detailed above: 
1. Add a call to `mkConfg` to the list at the bottom of `flake.nix` with your
   username, hostname, arch, and OS.
2. run `make switch`, following instructions of output if necessary.

## About direnvs/

Not every project is built with Nix flakes. Even with those with a flake.nix, they may not have the develop
environment they way I like. With nix-direnv, we are able to auto-switch to a nix development environment
according to `flake.nix`. Further more, this environment can be defined outside of the current working
directory. This is where the content of `direnvs/` comes in. For any project, I can add a `.envrc` file, which
points to a subdirectory of `direnvs/`, making its `flake.nix` the setup for dev environment. An example
project that may require standard Python dev tools may have `.envrc` like so:

```
use_flake ~/src/dotfiles/direnvs/python
```
