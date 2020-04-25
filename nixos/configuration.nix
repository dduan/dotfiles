{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  hardware.pulseaudio.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.checkJournalingFS = false;
  boot.cleanTmpDir = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  console.keyMap = "dvorak";
  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Los_Angeles";

  environment = {
    systemPackages = with pkgs; [
      alacritty
      firefox
      fish
      fzf
      git
      gnumake
      htop
      killall
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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.xserver = {
    enable = true;
    xkbVariant = "dvorak";

    displayManager = {
      gdm = {
        enable = true;
      };
    };
    desktopManager = {
      xterm.enable = false;
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu #application launcher most people use
        i3status # gives you the default i3 status bar
        i3lock #default i3 screen locker
        i3blocks #if you are planning on using i3blocks over i3status
     ];
    };
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

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.03"; # Did you read the comment?
}

