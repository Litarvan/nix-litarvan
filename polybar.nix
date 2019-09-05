{ pkgs, ... }:

# Created By Aditya Shakya @adi1090x
# Edited and ported to Nix by Litarvan

let
  bg = "#272727";
  fg = "#CACACA";
  ac = "#1E88E5";
  mf = "#383838";
in
  {
    enable = true;
  
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
      # iwSupport = true;
    };
    
    script = "polybar main &";
  
    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      
        # includes
      };
    
      "bar/main" = {
        monitor-strict = false;
        override-redirect = false;
        
        bottom = true;
        fixed-center = true;
        
        width = "100%";
        height = 36;
        
        offset-x = "0%";
        offset-y = "0%";
        
        background = bg;
        foreground = fg;
        
        radius-top = "0.0";
        radius-bottom = "0.0";
        
        overline-size = 6;
        underline-size = 6;
        overline-color = bg;
        underline-color = bg;
        
        border-top-size = 4;
        border-color = ac;
        
        padding = 0;
        
        module-margin-left = 0;
        module-margin-right = 0;
        
        font-0 = "Termsyn:size=12;2";
        font-1 = "Siji:size=12;2";
        font-2 = "xos4 Terminus:size = 12;1";
        
        modules-left = "i3 cpu";
        modules-center = "memory alsa battery backlight";
        modules-right = "network date";
       
        separator = ""; # ??
        
        spacing = 0;
        
        dim-value = "1.";
        
        tray-position = "right";
        tray-detached = false;
        tray-maxsize = 8;
        tray-background = bg;
        tray-offset-x = 0;
        tray-offset-y = 0;
        tray-padding = 0;
        tray-scale = "1.0";
        
        enable-ipc = true;
      };
      
      "settings" = {
        throttle-output = 5;
        throttle-output-for = 10;
        throttle-input-for = 30;
        
        screenchange-reload = false;
        
        compositing-background = "source";
        compositing-foreground = "over";
        compositing-overline = "over";
        comppositing-underline = "over";
        compositing-border = "over";
        
        pseudo-transparency = "false";
      };
      
      "module/alsa" = {
        type = "internal/alsa";
        
        format-volume = "VOL <label-volume>";
        format-volume-background = mf;
        format-volume-underline = bg;
        format-volume-overline = bg;
        format-volume-padding = 2;
        format-volume-margin = 2;
        
        label-volume = "%percentage%%";
        
        format-muted-background = mf;
        format-muted-underline = bg;
        format-muted-overline = bg;
        format-muted-padding = 2;
        format-muted-margin = 2;
        
        label-muted = "MUTED";
        label-muted-foreground = ac;
      };
      
      "module/backlight" = {
        type = "internal/xbacklight";

        card = "intel_backlight"; # TODO: Better way to fill this

        format = "LGT <label>";
        format-background = mf;
        format-underline = bg;
        format-overline = bg;
        format-padding = 2;
        
        label = "%percentage%%";
      };
      
      "module/battery" = {
        type = "internal/battery";
        
        full-at = 99;
        
        battery = "BAT1"; # TODO: Better way to fill this
        adapter = "ACAD";
        
        poll-interval = 2;
        
        time-format = "%H:%M";
        
        format-charging = "CHR <label-charging>";
        format-charging-background = mf;
        format-charging-underline = bg;
        format-charging-overline = bg;
        format-charging-padding = 2;
        
        label-charging = "%percentage%%";
        label-discharging = "%percentage%%";
        label-full = "FULL CHR";
        label-full-background = mf;
        label-full-underline = bg;
        label-full-overline = bg;
        label-full-padding = 2;
        label-full-margin = 2;
      };
      
      "module/cpu" = {
        type = "internal/cpu";
        
        interval = "0.5";
        
        format = "<label>";
        format-background = mf;
        format-underline = bg;
        format-overline = bg;
        format-padding = 2;
        format-margin = 1;
        
        label = "CPU %percentage%%";
      };
      
      "module/date" = {
        type = "internal/date";
        
        interval = "1.0";
        
        time = "%I:%M %p";
        time-alt = "%Y-%m-%d%";
        
        format = "<label>";
        format-padding = 4;
        format-foreground = fg;
        
        label = "%time%";
      };
      
      "module/filesystem" = {
        type = "internal/fs";
        
        mount-0 = "/";
        mount-1 = "/home";
        mount-2 = "/var";
        mount-3 = "/opt";
        
        interval = 10;
        fixed-values = true;
        
        format-mounted = "<label-mounted>";
        format-mounted-background = mf;
        format-mounted-underline = bg;
        format-mounted-overline = bg;
        format-mounted-padding = 2;
        format-mounted-margin = 0;
        
        format-unmounted = "<label-unmounted>";
        format-unmounted-background = mf;
        format-unmounted-underline = bg;
        format-unmounted-overline = bg;
        format-unmounted-padding = 2;
        format-unmounted-margin = 0;
        
        label-mounted = "FS %free%";
        label-unmounted = "%mountpoint%: not mounted";
      };
      
      "module/i3" = {
        type = "internal/i3";
        
        pin-workspaces = true;
        
        format = "<label-state> <label-mode>";
        
        label-mode = "%mode%";
        label-mode-padding = 2;
        label-mode-background = "#e60053";
        
        label-focused = "%index%";
        label-focused-foreground = "#ffffff";
        label-focused-background = "#3f3f3f";
        label-focused-underline = ac;
        label-focused-padding = 4;
        
        label-visible = "%index%";
        label-visible-underline = "#555555";
        label-visible-padding = 4;
        
        label-urgent = "%index%";
        label-urgent-foreground = "#000000";
        label-urgent-background = bg;
        label-urgent-padding = 4;
        
        label-separator = "|";
        label-separator-padding = 2;
        label-separator-foreground = fg;
        # TODO ?
      };
      
      "module/memory" = {
        type = "internal/memory";
        
        interval = 3;
        
        format = "<label>";
        format-background = mf;
        format-underline = bg;
        format-overline = bg;
        format-padding = 2;
        format-margin = 0;
        
        label = "MEM %percentage_used%%";
      };
      
      "module/network" = {
        type = "internal/network";
        interface = "eth0";
        
        interval = "1.0";
        
        accumulate-stats = true;
        unknown-as-up = true;
        
        format-connected = "<label-connected>";
        format-connected-background = mf;
        format-connected-underline = bg;
        format-connected-overline = bg;
        format-connected-padding = 2;
        format-connected-margin = 0;
        
        format-disconnected = "<label-disconnected>";
        format-disconnected-background = mf;
        format-disconnected-underline = bg;
        format-disconnected-overline = bg;
        format-disconnected-padding = 2;
        format-disconnected-margin = 0;
        
        label-connected = "D %downspeed:2% | U %upspeed:2%";
        label-disconnected = "DISCONNECTED";
      };
      
      "module/temperature" = {
        type = "internal/temperature";
        
        interval = "0.5";
        
        thermal-zone = 0; # TODO: Find a better way to fill that
        warn-temperature = 60;
        units = true;
        
        format = "<label>";
        format-background = mf;
        format-underline = bg;
        format-overline = bg;
        format-padding = 2;
        format-margin = 0;
        
        format-warn = "<label-warn>";
        format-warn-background = mf;
        format-warn-underline = bg;
        format-warn-overline = bg;
        format-warn-padding = 2;
        format-warn-margin = 0;
        
        label = "TEMP %temperature-c%";
        label-warn = "TEMP %temperature-c%";
        label-warn-foreground = "#f00"; 
      };
      
      #"module/wireless-network" = {
      #  type = "internal/network";
      #  interval = "wlp2s0";
      #};
      
      
    };
  }
