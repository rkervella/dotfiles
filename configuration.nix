# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, nixpkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    version = 2;
    efiSupport = true;
    enableCryptodisk = true;
    extraInitrd = /boot/initrd.keys.gz;
  };

  boot.initrd.luks.devices = [
    {
      name = "root";
      device = "/dev/disk/by-uuid/2e4017a1-cc39-4de3-a0ae-bfaf381dbefa";
      preLVM = true;
      keyFile = "/root.key";
      allowDiscards = true;
    }
  ];

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "fr";
    defaultLocale = "fr_FR.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    zsh
    wget
    vim
    git
    bspwm
    xautolock
    sxhkd
    dmenu
    rofi
    polybar
    termite
    chromium
    feh
    bc
    imagemagick
    keepassxc
    networkmanager
    usbguard
    arc-theme
    tango-icon-theme
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.bash.enableCompletion = true;
  programs.zsh.enableCompletion = true;
  # programs.mtr.enable = true;
  programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking = {
    firewall.enable = true;
    networkmanager.enable = true;
    proxy.allProxy = "http://127.0.0.1:8118";
    proxy.default = "http://127.0.0.1:8118";
  };

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services = {
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      layout = "fr";
      desktopManager.xterm.enable = false;
      # Enable touchpad support.
      libinput.enable = true;
      displayManager.lightdm.enable = true;
      # Window manager
      windowManager.bspwm.enable = true;
      windowManager.default = "bspwm";
      windowManager.bspwm.configFile = "/home/rkvl/.config/bspwm/bspwmrc";
      windowManager.bspwm.sxhkd.configFile = "/home/rkvl/.config/sxhkd/sxhkdrc";
    };
    udev.packages = with pkgs; [
      yubikey-personalization
    ];
    usbguard = {
      enable = true;
      IPCAllowedGroups = [ "wheel" ];
    };
    tor.enable = true;
    tor.client.enable = true;
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    fonts = with pkgs; [
      corefonts
      vistafonts
      inconsolata
      terminus_font
      proggyfonts
      dejavu_fonts
      siji
      font-awesome-ttf
      ubuntu_font_family
      source-code-pro
      source-sans-pro
      source-serif-pro
    ];
  };

  virtualisation.libvirtd.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.rkvl = {
    isNormalUser = true;
    uid = 1000;
    extraGroups = [ "wheel" "libvirtd" ];
  };

  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.03"; # Did you read the comment?

}
