UNAME_S := $(shell uname -s)

.PHONY: switch
switch:
ifeq ($(UNAME_S),Darwin)
	@# TODO: Xcode can't follow symlink for .xccolortheme :(
	@mkdir -p ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
	@cp Monokai.xccolortheme ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
endif
	@NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 home-manager switch --flake . --impure
