{ pkgs, ... }: {
  home.packages = with pkgs; [
    jamesdsp
  ];
}
