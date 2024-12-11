{ config, pkgs, ... }: {
  programs.kitty = { shellIntegration.enableZshIntegration = true; };
stylix.targets.kitty.enable = true;
}
