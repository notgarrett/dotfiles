{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    sops-nix.url = "github:Mic92/sops-nix";

    stylix.url = "github:danth/stylix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, stylix, nixos-hardware, sops-nix, ...
    }@inputs: {

      home-manager.nixosModules.home-manager = {

        extraSpecialArgs = { inherit inputs; };
        backupFileExtension = "backup";
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        users = { "garrett" = import ./home.nix; };
      };

      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/desktop/configuration.nix
            nixos-hardware.nixosModules.gigabyte-b550
            home-manager.nixosModules.home-manager
            sops-nix.nixosModules.sops
            stylix.nixosModules.stylix
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
