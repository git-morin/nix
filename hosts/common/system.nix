{ pkgs, ... }:
{
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_CA.UTF-8";
  environment.systemPackages = with pkgs; [
    nil
    nh
  ];
}