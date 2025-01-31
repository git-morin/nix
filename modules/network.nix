{ config, pkgs, ... }: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall = {
      allowedTCPPorts = [ 22 ];
      allowedUDPPorts = [ 22 ];
    };
  };

  services.openssh.enable = true;
}
