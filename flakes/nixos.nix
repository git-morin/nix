{ inputs, ... }:
let
  # Function to create multiple hosts
  mkNixOSHosts = 
    system: 
    hostUsers:
      builtins.mapAttrs (hostname: userList:
        inputs.nixpkgs.lib.nixosSystem {
          inherit system;
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
            inputs.vscode-server.nixosModules.default  
            {
              services.vscode-server.enable = true;
            }
          ];
        }
      ) hostUsers;
in
{
  flake.nixosConfigurations = mkNixOSHosts "x86_64-linux" {
    main = [ "gab" ];
    # server = [ "gab" "bees" ];
  };
}