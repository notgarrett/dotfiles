{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
stylix.url = "github:danth/stylix;
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };\

        modules = [
stylix.homeManagerModules.stylix
          ./hosts/desktop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      framework = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
stylix.homeManagerModules.stylix
          ./hosts/framework/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };
      hplaptop = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
stylix.homeManagerModules.stylix
          ./hosts/hp_laptop/configuration.nix
          inputs.home-manager.nixosModules.default
        ];
      };

    };
  };
}
