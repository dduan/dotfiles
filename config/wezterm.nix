{ fish }:
{
  enable = true;
  extraConfig = ''
    local my_molokai = wezterm.color.get_builtin_schemes()['Molokai']
    my_molokai.background = '#212121'
    my_molokai.foreground = '#dcdccc'
    return {
      color_schemes = {
        ['My Molokai'] = my_molokai,
      };
      color_scheme = "My Molokai",
      default_prog = { '${fish}/bin/fish', '--login', '--command=tmux attach; or tmux' },
      font = wezterm.font("SF Mono Nerd"),
      font_size = 14,
      hide_tab_bar_if_only_one_tab = true,
      window_background_opacity = 0.9,
      macos_window_background_blur = 20,
      window_padding = { left = 0, right = 0, top = 0, },
      window_decoration = None,
    }
  '';
}
