{ config, pkgs, lib, inputs, ... }: {

  stylix = {
    enable = true;
    image = ../images/marioinconsole.jpg;
    autoEnable = true;
    opacity = { terminal = 0.9; };
  };

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/monokai.yaml";

}
