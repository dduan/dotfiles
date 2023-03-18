UNAME_S := $(shell uname -s)
HOST=$(shell uname -n)
USER=$(shell whoami)

.PHONY: switch
switch:
ifeq ($(UNAME_S),Darwin)
	@# TODO: Xcode can't follow symlink for .xccolortheme :(
	@mkdir -p ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
	@cp config/*.xccolortheme ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
	@cp pkgs/sf-mono-nerd/* ${HOME}/Library/Fonts/
endif
	@NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 home-manager switch --flake .\#$(USER)@$(HOST) --impure --extra-experimental-features nix-command --extra-experimental-features flakes
