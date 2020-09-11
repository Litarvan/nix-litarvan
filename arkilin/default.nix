{ pkgs, ... }:

{
    home.packages = with pkgs; [
        arc-kde-theme papirus-icon-theme
    ];
}
