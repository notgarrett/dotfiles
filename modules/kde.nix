{ config, pkgs, lib, ... }:
# Should rename this to language tools.
with lib; {
 options.kde = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable my custom module";
    };
  };

  config = mkIf config.kde.enable {

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  };
}
