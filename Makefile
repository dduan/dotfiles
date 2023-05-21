UNAME_S := $(shell uname -s)
HOST=$(shell uname -n)
USER=$(shell whoami)

.PHONY: switch
switch:
ifeq ($(UNAME_S),Darwin)
	@cp pkgs/sf-mono-nerd/* ${HOME}/Library/Fonts/
endif
	@NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 home-manager switch --flake .\#$(USER)@$(HOST) --impure --extra-experimental-features nix-command --extra-experimental-features flakes
