

{ config, pkgs, lib, inputs, ... }:
{
 
    imports = [
    inputs.stylix.homeManagerModules.stylix
    #inputs.stylix.homeManagerModules.stylix
  ];


    stylix = {
      enable = true;
      image = ../animecarbackground.jpg;
      autoEnable = true;
      opacity = {
      terminal = 0.9;
      
    };
# fonts = {
#
#
#       serif = {
#           package = pkgs.liberation_ttf;
#           name = "Liberation Serif";
#         };
#
#         sansSerif = {
#           package = pkgs.fira;
#           name = "Fira Sans";
#         };
#
#         monospace = {
#           package = pkgs.nerd-fonts.fira-code;
#           name = "Fira Code Nerd Font";
#         };
#
#          emoji = {
#            package = pkgs.noto-fonts-emoji;
#            name = "Noto Color Emoji";
#          };
#
#       };
     };

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
}
