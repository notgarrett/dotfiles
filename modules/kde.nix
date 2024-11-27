{ config, pkgs, lib, ... }:

with lib; {
  options.hyprland = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable my custom module";
    };
  };

  config = mkIf config.hyprland.enable {
    environment.systemPackages = with pkgs; [
    ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  };
}
