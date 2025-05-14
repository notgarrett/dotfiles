{ config, pkgs, lib, ... }:

with lib; {
  options.steam = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable my custom module";
    };
  };

  config = mkIf config.steam.enable {
    boot.kernelModules = [ "xpad" "vfio-pci" ];
    environment.systemPackages = with pkgs;
      [
        protontricks
        xpad
        # Add packages you want to install
      ];

    # Steam 
    programs.steam = {
      enable = true;
      remotePlay.openFirewall =
        true; # Open ports in the firewall for Steam Remote Play
      gamescopeSession.enable = true;
      dedicatedServer.openFirewall =
        true; # Open ports in the firewall for Source Dedicated Server
    };

    programs.gamemode.enable = true;

  };
}
