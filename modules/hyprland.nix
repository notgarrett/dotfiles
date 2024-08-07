{ config, pkgs, lib, ... }:

with lib; 
{
  options.hyprland = {
    enable = mkOption {
      type = types.bool;
      default = false;
      description = "Enable my custom module";
    };
  };

  config = mkIf config.myModule.enable {
    environment.systemPackages = with pkgs;
      [
        # Add packages you want to install
        hyprpaper
      ];

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk pkgs.xdg-desktop-portal ];
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "${pkgs.hyprland}/bin/Hyprland";
          user = "garrett";
        };
        default_session = initial_session;
      };
    };

    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    services.myService = {
      enable = true;
      # Additional service configuration
    };
  };
}
