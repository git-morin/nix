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
            inputs.home-manager.nixosModules.home-manager (import ./home-manager.nix { inherit inputs system userList; })
            inputs.vscode-server.nixosModules.default ( import ./vscode-server.nix )
            inputs.minegrub-theme.nixosModules.default
          ];
        }
      );
in {
  flake.nixosConfigurations = nixosConfigurations "x86_64-linux" {
    main = [ "gab" ];
  };
}
