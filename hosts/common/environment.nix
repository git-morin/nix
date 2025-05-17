{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      os-prober
      nil
      nh
    ];
    sessionVariables.FLAKE = "/etc/nixos";
  };
}
