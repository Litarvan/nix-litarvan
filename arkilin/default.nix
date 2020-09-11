{ pkgs, ... }:

{
    home.packages = with pkgs; [
        spectacle qbitorrent
        arc-kde-theme papirus-icon-theme
    ];
}
