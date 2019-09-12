{ config, pkgs, lib, ... }:

let
  py-packages = python-packages: with python-packages; [ (import ./anime-downloader.nix) ];
  python-with-packages = pkgs.python3.withPackages py-packages;
in
{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    htop conky neofetch zip unzip aria2 emacs scrot auctex aspell nodejs
    powerline-fonts roboto siji (import ./termsyn.nix) source-code-pro
    python-with-packages
    discord idea.idea-ultimate idea.webstorm vlc
  ];

  programs = {
    firefox.enable = true;
    home-manager.enable = true;
    command-not-found.enable = true;

    alacritty = import ./alacritty.nix {};
    rofi = import ./rofi.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Adrien Navratil";
      userEmail = "adrien1975" + "@" + "live.fr";
    };
  };

  # TODO: Remove ?  
  # fonts.fontconfig.enable = true;
    
  xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
  
  services = {
    compton = import ./compton.nix {};
    polybar = import ./polybar.nix { inherit pkgs; };
  };
}
