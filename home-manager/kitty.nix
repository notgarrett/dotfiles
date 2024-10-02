{ config, pkgs, ... }: {
  programs.kitty = { shellIntegration.enableZshIntegration = true; };
}
