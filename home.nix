{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    htop conky neofetch git
    powerline-fonts roboto siji (import ./termsyn.nix)
  ];

  programs = {
    firefox.enable = true;
    home-manager.enable = true;
    command-not-found.enable = true;

    alacritty = import ./alacritty.nix {};
    rofi = import ./rofi.nix { inherit pkgs; };
  };
  
  fonts.fontconfig.enable = true;
    
  xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
  
  services = {
    compton = import ./compton.nix {};
    polybar = import ./polybar.nix { inherit pkgs; };
  };
}
