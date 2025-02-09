{ inputs, system }:
{ config, pkgs, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users = builtins.listToAttrs (map (name: {
      inherit name;
      value = import ../homes/${name} { inherit inputs system; };
    }) config.users);
  };
}
