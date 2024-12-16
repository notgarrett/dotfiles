{ 
   wayland.windowManager.hyprland = {
   enable = true;
    extraConfig = builtins.readFile ./hyprland;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = ["../../images/animecarbackground.jpg"];
    };
    wallpaper = ["HDMI-A-1,../../images/animecarbackground.jpg"
"HDMI-A-2,../../images/animecarbackground.jpg"
    ];
  };
  # programs.waybar.enable = true;




 
}

