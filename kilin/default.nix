{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        conky
        emacs auctex aspell
        siji (import ./termsyn.nix)
        wpa_supplicant
    ];

    programs = {
        rofi = import ./rofi.nix { inherit pkgs; };
    };

    services = {
        picom = import ./picom.nix {};
        polybar = import ./polybar.nix { inherit pkgs; };
    };

    xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
}
