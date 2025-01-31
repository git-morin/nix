{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
    ./modules/system.nix
    ./modules/desktop.nix
    ./modules/network.nix
    ./modules/users.nix
  ];

  system.stateVersion = "24.11";
}
