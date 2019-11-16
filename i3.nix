{ pkgs, lib, ... }:

{
  enable = true;
  package = pkgs.i3-gaps;
  
  config = rec {
    modifier = "Mod1";
    bars = [];
		
    window.border = 0;
		
    gaps = {
      inner = 15;
      outer = 15;
    };
    
    keybindings = lib.mkOptionDefault {
      "${modifier}+Return" = null;
      "${modifier}+Shift+Return" = "exec ${import ./alacritty-master.nix}/bin/alacritty";
      "${modifier}+d" = "exec ${pkgs.rofi}/bin/rofi -modi drun -show drun";
      "${modifier}+Shift+d" = "exec ${pkgs.rofi}/bin/rofi -show window";
      "${modifier}+Shift+m" = "exec ${pkgs.firefox}/bin/firefox";

      "${modifier}+Shift+b" = "exec systemctl poweroff";
      "${modifier}+Shift+x" = "exec systemctl suspend";
    };
		
    startup = [
      {
        command = "${pkgs.bash}/bin/bash ~/screens.sh"; # TODO: Check if exists
        always = true;
      }

      {
        command = "${pkgs.feh}/bin/feh --bg-scale /home/litarvan/background.png"; # TODO: fetch background from URL
        always = true;
        notification = false;
      }

      {
        command = "${pkgs.conky}/bin/conky -c ${import ./conky.nix { inherit pkgs; }}";
        notification = false;
      }
    ];
  };
}
