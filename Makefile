UNAME_S := $(shell uname -s)

.PHONY: switch
switch:
ifeq ($(UNAME_S),Darwin)
	@# TODO: Xcode can't follow symlink for .xccolortheme :(
	@mkdir -p ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
	@cp Monokai.xccolortheme ${HOME}/Developer/Xcode/UserData/FontAndColorThemes
	@home-manager switch
endif
