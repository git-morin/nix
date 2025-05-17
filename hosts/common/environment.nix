{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      os-prober
      nil
      nh
    ];
    sessionVariables.NH_FLAKE = "/etc/nixos";
  };
}
