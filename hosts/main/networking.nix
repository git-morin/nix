{ lib, ... }:
{
  networking = {
    hostName = "main";
    networkmanager.enable = true;
    useDHCP = lib.mkDefault true;
  };
}
