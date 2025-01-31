{ config, pkgs, ... }: {
  users.users.gab = {
    isNormalUser = true;
    description = "gab";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      git
      rustdesk
    ];
  };
}
