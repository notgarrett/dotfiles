{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      (pkgs.writeShellScriptBin "editconfig" ''
        
#!/usr/bin/env bash

# Save the starting directory
pushd . > /dev/null

CONFIG_PATH="/etc/nixos"
nvim "$CONFIG_PATH"

if [ $? -eq 0 ]; then
  echo "Updating system..."
  sudo nixos-rebuild switch

  if [ $? -eq 0 ]; then
    echo "System updated successfully. Committing changes to Git..."

    cd "$CONFIG_PATH" || {
      echo "Failed to change directory to $CONFIG_PATH"
      popd > /dev/null
      exit 1
    }

    nixfmt .
    git add .
    git commit -m "Update NixOS configuration on $(date +'%Y-%m-%d %H:%M:%S')"
    git push

    if [ $? -eq 0 ]; then
      echo "Changes pushed to remote repository."
    else
      echo "Git push failed."
    fi
  else
    echo "System update failed. Git operations aborted."
  fi
else
  echo "Neovim exited with an error. System not updated."
fi

# Return to the original directory
popd > /dev/null
      '')
    ];
}


# {
#   environment.systemPackages = with pkgs;
#     [
#       (pkgs.writeShellScriptBin "editconfig" ''
#         #!/usr/bin/env bash
#         CONFIG_PATH="/etc/nixos"
#         nvim "$CONFIG_PATH"
#         if [ $? -eq 0 ]; then
#           echo "Updating system..."
#           sudo nixos-rebuild switch
#         else
#           echo "Neovim exited with an error. System not updated."
#         fi
#       '')
#     ];
# }
