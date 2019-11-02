{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.checkJournalingFS = false;
  boot.cleanTmpDir = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  i18n = {
    consoleKeyMap = "dvorak";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "America/Los_Angeles";

  environment = {
    systemPackages = with pkgs; [
      fish
      git
      tig
      zip
      unzip
      neovim
    ];
    variables.EDITOR = "neovim"; 
  };

  nixpkgs.config.packageOverrides = pkgs: {
    neovim = pkgs.neovim.override {
      vimAlias = true;
      viAlias = true;
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  users.users.dan = {
    isNormalUser = true;
    home = "/home/dan";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = "/run/current-system/sw/bin/fish";
  };

  programs.fish.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}

