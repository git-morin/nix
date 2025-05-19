{ pkgs, ...}:
{
  home.packages = with pkgs; [
    qbittorrent-enhanced
    steam-tui
  ];
}