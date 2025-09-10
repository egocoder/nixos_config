{
  description = "My minimal system configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; }; 

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, stylix, ... }: let
    system = "x86_64-linux";
    user = "ego";
    homeStateVersion = "25.05";

    hosts = [
      { hostname = "hubris"; stateVersion = "25.05"; }
    ];

    makeSystem = { hostname, stateVersion }: nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs stateVersion hostname user; };

      modules = [
        stylix.nixosModules.stylix 
        home-manager.nixosModules.home-manager
        ./hosts/${hostname}/configuration.nix
      ];
    };

  in {
    nixosConfigurations = builtins.listToAttrs (map (host: {
      name = host.hostname;
      value = makeSystem host;
    }) hosts);

    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.${system};
      extraSpecialArgs = { inherit inputs homeStateVersion user; };
      modules = [ ./home_manager/home.nix ];
    };
  };
}

