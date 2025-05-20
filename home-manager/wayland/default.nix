{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland/hyprland.conf;
  };

  services.hyprpaper = let
    mario = builtins.toString ../../images/marioinconsole.jpg;
    gamebois = builtins.toString ../../images/gamebois.png;
  in {
    enable = true;
    settings = {
      preload = [ mario gamebois ];
      wallpaper = [ "HDMI-A-1,${mario}" "HDMI-A-2,${gamebois}" ];
    };
  };
  programs.waybar = {
    enable = true;
    #style = builtins.readFile ./waybar/style.css;
    settings = {
      mainBar = {
        layer = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "tray"
          "cpu"
          "memory"
          "backlight"
          "network"
          "pulseaudio"
          "battery"
          "clock"
        ];

        tray = { spacing = 10; };

        clock = {
          tooltip-format = "{:%Y-%m-%d | %H:%M}";
          format-alt = "{:%Y-%m-%d}";
          format = "{:%a %Y-%m-%d %l:%M %p}";
        };

        cpu = { format = "　{usage}%"; };

        memory = { format = "　{}%"; };

        backlight = {
          format = "　{percent}%";
          format-icons = [ "" "" ];
        };

        battery = { format = "　{capacity}%"; };

        network = {
          format-wifi = "　{signalStrength}%";
          format-ethernet = "{ifname}: {ipaddr}/{cidr} ethernet";
          format-disconnected = "⚠";
        };

        pulseaudio = {
          format = "　{volume}%";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            handsfree = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" ];
          };
          on-click = "pavucontrol";
        };
      };
    };
  };

}

