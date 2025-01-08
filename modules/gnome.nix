{ config, pkgs, lib, ... }:

with lib; {
  options = {
    gnome = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable my custom module";
      };
    };
  };

  config = mkIf config.gnome.enable {

    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

  };
}
