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
        "HDMI-A-1,../../images/chickenbackground.jpg"
        "HDMI-A-2,../../images/chickenbackground.jpg"
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

