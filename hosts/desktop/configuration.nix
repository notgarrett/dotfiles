{ config, pkgs, inputs, sops, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ../../modules/hyprland.nix
    ../../modules/postgres.nix
    ../../modules/nvidia.nix
    ../../modules/steam.nix
    ../../modules/gnome.nix
    ../../modules/language-servers.nix
    ../../modules/kde.nix
    ../../modules/stylix.nix
    ../../modules/cloudflared.nix
    ../../modules/minecraft.nix
    ../../modules/gpupassthrough.nix
    ../../scripts
    ../../modules/system-packages.nix
  ];

  language-servers.enable = true;
  hyprland.enable = true;
  nvidia.enable = true;
  kde.enable = false;
  postgres.enable = true;
  steam.enable = true;
  gnome.enable = false;

  services.flatpak.enable = true;
  virtualisation.docker.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "intel_iommu=on" "kvm-intel" ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "desktop"; # Define your hostname.
  networking.networkmanager.wifi.backend = "iwd";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/a6cd37ea-f9bc-4215-9ac7-cdd06e13417b";
    fsType = "ext4";
    options = [ "users" "defaults" "exec" ];
  };

  # Enable networking
  networking.networkmanager.enable = true;
  # networking.networkmanager.wifi.backend = "wpa_supplicant";

  # Set your time zone.
  time.timeZone = "America/Toronto";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";
  # Enable flakes 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Zsh

  services.ollama = {
    enable = true;
    acceleration = "cuda";
  };

  services.fwupd.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerd-fonts.fira-code
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.garrett = {
    isNormalUser = true;
    description = "garrett";
    extraGroups =
      [ "networkmanager" "wheel" "libvirtd" "kvm" "qemu" "libvirt-qemu" ];

    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [

      # List package dependencies here
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
    ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # SOPS Temporary, move to module.

  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";

  sops.age.keyFile = "/home/garrett/.config/sops/age/keys.txt";

  # Bluetooth things.
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot =
    true; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    backupFileExtension = "backurp";
    useGlobalPkgs = true;
    useUserPackages = true;
    users = { "garrett" = import ../../home.nix; };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
