{ inputs, ... }:
let
  nixosConfigurations = system:
    builtins.mapAttrs
      (hostname: userList:
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ../hosts/${hostname}
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users = builtins.listToAttrs (map (name: {
                  inherit name;
                  value = import ../homes/${name} { inherit inputs system; };
                }) userList);
              };
            }
          ];
        }
      );
in {
  flake.nixosConfigurations = nixosConfigurations "x86_64-linux" {
    main = [ "gab" ];
  };
}
