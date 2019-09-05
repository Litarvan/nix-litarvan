{ pkgs, ... }:

pkgs.writeText "conky-config" ''
  conky.config = {
    alignment = 'top_left',
    background = true,
    color1 = '#2ECC71',
    color2 = '#BF6715',
    cpu_avg_samples = 2,
    default_color = 'FFFFFF',
    double_buffer = true,
    font = 'Roboto:size=12',
    gap_x = 60,
    gap_y = 50,
    minimum_width = 200,
    no_buffers = true,
    own_window = true,
    own_window_type = 'override',
    own_window_transparent = true,
    own_window_class = 'Conky',
    update_interval = 1.0,
    use_xft = true,
  }

  conky.text = [[
  ''${font Robot:light:size=72}''${time %H}:''${time %M}
  ''${font Roboto:light:size=36}''${time %A} ''${time %d} ''${time %B}
  ''${font Roboto:light:size=18}· Le CPU est actuellement utilisé à ''${cpu cpu0}%
  · Il y a $mem de RAM utilisé
  · Il y a ''${fs_free /home} de libre dans /home, et ''${fs_free /} dans /
  ]]
''
