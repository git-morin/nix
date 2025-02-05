let
  lib = import ../../lib;
in
{
  imports = lib.importNixFiles ./. ++ [ 
    ../common
  ];

  networking = {
    hostName = "main";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.11";
}