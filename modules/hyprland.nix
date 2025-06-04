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
      # Add packages you want to install
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      hyprpaper
      waybar
      wl-clipboard
      hyprshot
      greetd.tuigreet
      hyprcursor
    ];

    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-hyprland
      ];
      config = { common.default = [ "gtk" ]; };
    };

    services.greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command =
            "${pkgs.greetd.tuigreet}/bin/tuigreet --time --asterisks --cmd Hyprland";
          #command = "${pkgs.hyprland}/bin/Hyprland";
          user = "garrett";
        };
        default_session = initial_session;
      };
    };

    programs.hyprland.enable = true;
    programs.hyprland.xwayland.enable = true;
    environment = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1"; # Hint electron apps to use wayland
        WLR_NO_HARDWARE_CURSORS =
          "1"; # Fix cursor rendering issue on wlr nvidia.

        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        XDG_SESSION_DESKTOP = "Hyprland";

        GBM_BACKEND = "nvidia-drm";
        __GLX_VENDOR_LIBRARY_NAME = "nvidia";
        LIBVA_DRIVER_NAME = "nvidia";
        __GL_GSYNC_ALLOWED = "1";
        __GL_VRR_ALLOWED = "0";
        WLR_DRM_NO_ATOMIC = "1";

        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt5ct";

        GDK_SCALE = "2";

        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        NVD_BACKEND = "direct";
      };
    };
  };
}
