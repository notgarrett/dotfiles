

{ config, pkgs, lib, stylix,... }:
# Should rename this to language tools.
with lib; {
  options.stylix = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = "Enable stylix";
    };
  };

  config = mkIf config.language-servers.enable {
    stylix = {
      enable = true;
      image = ../animecarbackground.jpg;
    };
    };
}
