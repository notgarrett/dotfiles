

{ config, pkgs, lib, inputs, ... }:
{
 
    imports = [
    inputs.stylix.homeManagerModules.stylix
    #inputs.stylix.homeManagerModules.stylix
  ];


    stylix = {
      enable = true;
      image = ../animecarbackground.jpg;
    };

  stylix.autoEnable = true;
  stylix.targets.kitty.enable = true;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
}
