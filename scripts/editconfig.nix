{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (pkgs.writeShellScriptBin "editconfig" ''
      #!/usr/bin/env bash
      CONFIG_PATH="/etc/nixos"
      nvim "$CONFIG_PATH"
      if [ $? -eq 0 ]; then
        echo "Updating system..."
        sudo nixos-rebuild switch
      else
        echo "Neovim exited with an error. System not updated."
      fi
    '')
  ];
}
