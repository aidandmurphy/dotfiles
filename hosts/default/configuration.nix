# configuration.nix
{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix

      inputs.home-manager.nixosModules.default
    ];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aidan = {
    isNormalUser = true;
    description = "aidan";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # System-Wide Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    fastfetch
    greetd.greetd
    greetd.tuigreet
    polkit
    polkit_gnome
    brightnessctl
    ranger
    cudatoolkit
    git
    gh

    arandr
    playerctl
    pulseaudio
    hplip

    # Hyprland

    hyprpaper
    hyprcursor
    bibata-cursors
    noto-fonts    
  ];

  # Printing
  hardware.sane.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.mullvad-vpn = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  services.blueman.enable = true;
  
programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    package = pkgs.steam.override {
      extraLibraries = pkgs: [ pkgs.xorg.libxcb ];
      extraPkgs =
        pkgs: with pkgs; [
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
          gamemode
          ];
      };
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };

  home-manager = {

    extraSpecialArgs = { inherit inputs; };
    users = {
      "aidan" = import ./home.nix;
    };

  };

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };



hardware.graphics.enable = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  services.xserver.videoDrivers = [ "nvidia" ];

  boot.kernelParams = [
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];

  nixpkgs.config.packageOverrides = pkgs: { inherit (pkgs) linuxPackages_latest nvidia_x11; };
  hardware.nvidia = {
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };


  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  #AutoMount
    boot.supportedFilesystems = [ "ntfs" "btrfs" ];

  fileSystems."/run/media/aidan/ExternalHD" = {
    device = "/dev/disk/by-uuid/24192912-ace9-40a0-b46a-7fdfa7535fc3";
  };

  fileSystems."/run/media/aidan/InternalHD" = {
    device = "/dev/disk/by-uuid/b6fbb1f5-06f7-4766-8e5a-91bc45019706";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ 7700  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.05"; # Did you read the comment?
}
