{ config, pkgs, lib, ... }:

with lib; {
  options = {
    kde = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable my custom module";
      };
    };

    kde5 = {
      enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable my custom module";
      };
    };
  };

  config = mkMerge [
    (mkIf config.kde.enable {
      environment.systemPackages = with pkgs; [ ];

      services.xserver.enable = true;
      services.displayManager.sddm.enable = true;
      services.desktopManager.plasma6.enable = true;
    })
    (mkIf config.kde5.enable {
      environment.systemPackages = with pkgs;
        [

        ];

      services.xserver.enable = true;
      # You may need to comment out "services.displayManager.gdm.enable = true;"
      services.displayManager.sddm.enable = true;
      services.xserver.desktopManager.plasma5.enable = true;

    })
  ];

}
