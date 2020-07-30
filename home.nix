{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
in
{
  imports = [
    ./local.nix # See local.example.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    htop neofetch zip unzip aria2 scrot feh alacritty file hfsprogs lz4 ntfs3g patchelf unrar wget gnupg
    nodejs gradle adoptopenjdk-bin rustup gcc m4 gnumake binutils docker-compose
    powerline-fonts roboto source-code-pro dejavu_fonts noto-fonts-emoji jetbrains-mono
    unstable.idea.clion unstable.idea.idea-ultimate unstable.idea.rider unstable.idea.pycharm-community unstable.android-studio
    discord krita vlc qbittorrent
  ];

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;

    alacritty = import ./alacritty.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Adrien Navratil";
      userEmail = "adrien1975" + "@" + "live.fr";
    };
  };

  services = {
    redshift = {
      enable = true;
      provider = "geoclue2";
    };

    gpg-agent = {
      enable = true;

      enableSshSupport = true;
      pinentryFlavor = "curses";
    };
  };
}
