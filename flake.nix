{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    sops-nix.url = "github:Mic92/sops-nix";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-minecraft, home-manager, stylix, nixos-hardware
    , sops-nix, ... }@inputs: {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/configuration.nix
            nixos-hardware.nixosModules.gigabyte-b550
            sops-nix.nixosModules.sops
            stylix.nixosModules.stylix
            nix-minecraft.nixosModules.minecraft-servers
            { nixpkgs.overlays = [ inputs.nix-minecraft.overlay ]; }
          ];
        };
        framework = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/framework/configuration.nix
            home-manager.nixosModules.home-manager
            stylix.nixosModules.stylix
          ];
        };
        hplaptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/hp_laptop/configuration.nix
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops

            stylix.nixosModules.stylix
          ];
        };

      };
    };
}
