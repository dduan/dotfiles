{ fish }:
{
  enable = true;
  extraConfig = ''
    return {
      color_scheme = "GruvboxDarkHard",
      default_prog = { '${fish}/bin/fish', '--login', '--command=tmux attach; or tmux' },
      font = wezterm.font("SF Mono Nerd"),
      font_size = 14,
      hide_tab_bar_if_only_one_tab = true,
      macos_window_background_blur = 20,
      window_padding = { left = 0, right = 0, top = 0, },
      window_decoration = None,
    }
  '';
}
