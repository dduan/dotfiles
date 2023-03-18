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
      dpi = 220,
      font = wezterm.font("SF Mono Nerd", { weight = 'DemiBold' }),
      font_size = 14,
      hide_tab_bar_if_only_one_tab = true,
    }
  '';
}
