# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp39s0.useDHCP = true;
  networking.interfaces.wlp41s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    keyMap = "dvorak";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  environment = {
    systemPackages = with pkgs; [
      _1password
      alacritty
      firefox
      fish
      fzf
      git
      gnumake
      htop
      killall
      lxqt.pavucontrol-qt
      neovim
      obs-studio
      p7zip
      polybarFull
      ripgrep
      rofi
      tig
      tmux
      tre-command
      unzip
      vscode
      vlc
      xclip
      zip
    ];
    pathsToLink = [ "libexec" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
    packageOverrides = pkgs: {
      neovim = pkgs.neovim.override {
        vimAlias = true;
        viAlias = true;
      };
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
  services.openssh.enable = true;
  services.xserver = {
    enable = true;
    screenSection = ''
      Option         "metamodes" "1920x1080_60 +0+0"
    '';

    xkbVariant = "dvorak";

    displayManager.gdm.enable = true;
    desktopManager.xterm.enable = false;
    windowManager.i3.enable = true;
  };

  users.users.dan = {
    isNormalUser = true;
    home = "/home/dan";
    extraGroups = [
      "audio"
      "wheel"
    ];
    shell = "/run/current-system/sw/bin/fish";
  };

  programs.fish.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.03"; # Did you read the comment?

}

