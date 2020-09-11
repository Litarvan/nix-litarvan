{ pkgs, ... }:

{
    home.packages = with pkgs; [
        spectacle krita qbitorrent
        arc-kde-theme papirus-icon-theme
    ];
}
