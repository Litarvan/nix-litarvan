{ config, pkgs, lib, ... }:

let
  unstable = import <nixos-unstable> { config.allowUnfree = true; };
  discordUpdated = pkgs.discord.override rec {
    version = "0.0.17";
    src = builtins.fetchurl {
      url = "https://dl.discordapp.net/apps/linux/${version}/discord-${version}.tar.gz";
      sha256 = "058k0cmbm4y572jqw83bayb2zzl2fw2aaz0zj1gvg6sxblp76qil";
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
      nodejs-17_x gradle adoptopenjdk-bin rustup gcc m4 gnumake binutils docker-compose
      powerline-fonts roboto source-code-pro dejavu_fonts noto-fonts-emoji jetbrains-mono
      unstable.jetbrains.clion unstable.jetbrains.idea-ultimate # android-studio
      unstable.discord krita spectacle vlc obs-studio qbittorrent # steam discordUpdated
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

      includes = [
        {
          path = "/home/litarvan/.gitconfig-cri";
          condition = "gitdir:/home/litarvan/Documents/CRI/";
        }
      ];
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
