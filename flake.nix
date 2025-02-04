{
  description = "Marino's environment flake";

  inputs = {
    # Where we get most of our software. Giant mono repo with recipes
    # called derivation that say how to build software
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable"; # newest version as of May 2023, probably needs to get updated in November, alternative is nixpkgs-unstable

    # Manages config links things into your home directory
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Controls system-level software and settings including fonts
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    pwnvim.url = "github:zmre/pwnvim";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    darwin,
    pwnvim,
    ...
  }: {
    # you can have multiple darwinConfigurations per flake, one per hostname
    darwinConfigurations."MARINO-MM2" = darwin.lib.darwinSystem {
      # "x86_64-darwin" if you're using a pre M1 mac
      system = "aarch64-darwin";
      pkgs = import nixpkgs {system = "aarch64-darwin";};
      modules = [
        ./hosts/Marino-MM2/default.nix
        {
          users.users.marino.home = "/Users/marino";
        }
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit pwnvim;};
            users.marino.imports = [./hosts/Marino-MM2/marino.nix];
          };
        }
      ];
    };
    darwinConfigurations."Marino-MA13" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      pkgs = import nixpkgs {system = "aarch64-darwin";};
      modules = [
        ./hosts/Marino-MA13/default.nix
        {
          users.users.marino.home = "/Users/marino";
        }
        inputs.home-manager.darwinModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit pwnvim;};
            users.marino.imports = [./hosts/Marino-MA13/marino.nix];
          };
        }
      ];
    };
 
  };
}
