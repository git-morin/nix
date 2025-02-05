{ pkgs, ... }: {
  home.packages = with pkgs; [
    nixvim
  ];
}