{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
  discordUpdated = pkgs.discord.override rec {
    version = "0.0.13";
    src = builtins.fetchurl {
      url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "0d5z6cbj9dg3hjw84pyg75f8dwdvi2mqxb9ic8dfqzk064ssiv7y";
    };
  };
in
{
  imports = [
    ./local.nix # See local.example.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "litarvan";
    homeDirectory = "/home/litarvan";

    packages = with pkgs; [
      htop neofetch zip unzip aria2 scrot feh alacritty file hfsprogs lz4 ntfs3g patchelf unrar wget gnupg findutils imagemagick p7zip
      nodejs-12_x gradle adoptopenjdk-bin rustup gcc m4 gnumake binutils docker-compose
      powerline-fonts roboto source-code-pro dejavu_fonts noto-fonts-emoji jetbrains-mono
      unstable.idea.clion unstable.idea.idea-ultimate android-studio
      discordUpdated krita spectacle vlc obs-studio qbittorrent steam
    ];
  };

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;

    alacritty = import ./alacritty.nix { inherit pkgs; };

    git = {
      enable = true;
      userName = "Adrien Navratil";
      userEmail = "adrien1975" + "@" + "live.fr";
      signing = {
        key = "17A2B0DE7DF916C6";
        signByDefault = true;
      };
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
