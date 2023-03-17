{ fish }:
{
  enable = true;
  extraConfig = ''
    return {
      color_scheme = "Molokai",
      default_prog = { '${fish}/bin/fish', '--login', '--command=tmux attach; or tmux' },
      dpi = 220,
      font = wezterm.font("Liga SFMono Nerd Font", { weight = 'DemiBold' }),
      font_size = 14,
      hide_tab_bar_if_only_one_tab = true,
    }
  '';
}
