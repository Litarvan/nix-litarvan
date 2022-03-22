{ pkgs, lib, ... }:

let
    wallpaper = builtins.fetchurl {
      url = https://litarvan.com/wallpaper.png;
      sha256 = "1vapra7w4ch4y445gijx6dxw4ki2xpwln728wzl1aif1ymhidn2j";
    };
in
{
  enable = true;
  package = pkgs.i3-gaps;
  
  config = rec {
    modifier = "Mod4";
    bars = [];
		
    window.border = 0;
		
    gaps = {
      inner = 15;
      outer = 15;
    };
    
    keybindings = lib.mkOptionDefault {
      "${modifier}+Return" = null;
      "${modifier}+Shift+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun -show-icons";
      "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
      "${modifier}+Shift+m" = "exec ${pkgs.firefox}/bin/firefox";
      "${modifier}+Shift+s" = "exec ${pkgs.spectacle}/bin/spectacle -r";

      "${modifier}+Shift+b" = "exec systemctl poweroff";
      "${modifier}+Shift+x" = "exec systemctl suspend";
    };
		
    startup = [
      {
        command = "${pkgs.bash}/bin/bash ~/screens.sh"; # TODO: Check if exists
        always = true;
      }

      {
        command = "${pkgs.feh}/bin/feh --bg-scale ${wallpaper}";
        always = true;
        notification = false;
      }

      {
        command = "${pkgs.conky}/bin/conky -c ${import ./conky.nix { inherit pkgs; }}";
        notification = false;
      }

      {
        command = "${pkgs.numlockx}/bin/numlockx";
        always = true;
      }

      {
        command = "${pkgs.discord}/bin/Discord --enable-gpu-rasterization";
        notification = false;
      }

      {
        command = "setxkbmap -option caps:swapescape";
        always = true;
      }
    ];
  };
}
