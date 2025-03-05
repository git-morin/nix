{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      nil
      nh
    ];
    sessionVariables.FLAKE = "/etc/nixos";
  };
}
