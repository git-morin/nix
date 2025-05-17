{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      os-prober
      nil
      nh
      nushell
    ];
    sessionVariables.NH_FLAKE = "/etc/nixos";
  };
}
