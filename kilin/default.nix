{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        conky
        emacs auctex aspell
        siji (import ./termsyn.nix)
    ];

    programs = {
        rofi = import ./rofi.nix { inherit pkgs; };
    };

    services = {
        compton = import ./compton.nix {};
        polybar = import ./polybar.nix { inherit pkgs; };
    };

    xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
}