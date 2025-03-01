{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      astal,
      ags,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {      
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          modules = [
            ./nixos


            home-manager.nixosModules.home-manager
	    {
      		home-manager.backupFileExtension = "bkup";
     	 	home-manager.useGlobalPkgs = true;
      		home-manager.users.aidan = import ./home-manager/default.nix;    
      		home-manager.extraSpecialArgs = { inherit inputs; inherit pkgs; };
	    }

          ];
        };
      };
    };
}
