{
  wayland.windowManager.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ./hyprland/hyprland.conf;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "../../images/chickenbackground.jpg" ];
      wallpaper = [
        "HDMI-A-1,../../images/marioinvonsole.png"
        "HDMI-A-2,../../images/gamebois.png"
      ];
    };

  };
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar/style.css;
    settings = {

    };
  };

}

