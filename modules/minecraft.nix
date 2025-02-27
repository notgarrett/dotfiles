
{ pkgs, lib, inputs, ... }:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;

    package = pkgs.minecraft-server-1-16; # Use a version compatible with Minecraft Eternal (e.g., 1.16.5)
    dataDir = "/var/lib/someotherdir";

    servers = {
      minecraft-eternal-server = {
        enable = true;
        package = pkgs.minecraft-server-forge-1_16_5; # Use Forge, compatible with Minecraft Eternal

        serverProperties = {/* Define the properties for Minecraft Eternal, e.g., difficulty, max players */};
        whitelist = {/* Set whitelist if needed */};

        symlinks = 
        let
          modpack = (pkgs.fetchPackwizModpack {
            url = "https://minecraft-eternal-curseforge-url/pack.toml"; # Get the actual URL for Minecraft Eternal's pack.toml
            packHash = "sha256-<hash>"; # Provide the correct hash for pack.toml
          });
        in {
          "mods" = "${modpack}/mods"; # Link to the modpack's mods
        };
      };
    };
  };

  # Other configuration...
}

