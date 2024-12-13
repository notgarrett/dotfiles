{ 
  wayland.windowManager.hyprland.enable = true;
  programs.waybar.enable = true;



home.file = {
  ".config/hyprland" = {
    source = ./hyprland;
    recursive = true;
  };
  ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };
};


}

