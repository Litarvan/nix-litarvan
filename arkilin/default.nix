{ pkgs, ... }:

{
    home.packages = with pkgs; [
        obs-studio spectacle
        arc-kde-theme papirus-icon-theme
    ];
}