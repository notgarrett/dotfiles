{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {        
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/desktop/configuration.nix
          #stylix.nixosModules.stylix
          #          home-manager.nixosModules.home-manager.default
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/framework/configuration.nix
          #stylix.nixosModules.stylix
        ];
      };
      hplaptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/hp_laptop/configuration.nix
          #stylix.nixosModules.stylix
        ];
      };

    };
  };
}
