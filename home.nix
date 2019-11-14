{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    htop conky neofetch zip unzip aria2 emacs scrot auctex aspell feh
    nodejs gradle zulu8 rustup gcc m4 gnumake binutils
    powerline-fonts roboto siji (import ./termsyn.nix) source-code-pro dejavu_fonts noto-fonts-emoji
    steam wine winetricks
    discord idea.idea-ultimate idea.webstorm idea.clion vlc android-studio gimp
  ];

  programs = {
    firefox.enable = true;
    home-manager.enable = true;
    command-not-found.enable = true;

    alacritty = import ./alacritty.nix { inherit pkgs; };
    rofi = import ./rofi.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Adrien Navratil";
      userEmail = "adrien1975" + "@" + "live.fr";
    };
  };
    
  xsession.windowManager.i3 = import ./i3.nix { inherit pkgs lib; };
  
  services = {
    compton = import ./compton.nix {};
    polybar = import ./polybar.nix { inherit pkgs; };
  };
}
