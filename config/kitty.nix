{ fish, neovim }:
{
  enable = true;
  settings = {
    allow_remote_control = "yes";
    shell = "${fish}/bin/fish --login";
    copy_on_select = "yes";
    clear_all_shortcuts = "yes";
    font_size = "14.0";
    font_family = "Liga SFMono Nerd Font Semibold";
    cursor_shape = "block";
    shell_integration = "no-cursor";
    enabled_layouts = "splits";
    tab_bar_edge = "top";
    tab_bar_style = "powerline";
    tab_powerline_style = "round";
    tab_title_template = "{index}: {title}";
    active_tab_foreground = "#000";
    active_tab_background = "#eee";
    active_tab_font_style = "bold-italic";
    inactive_tab_foreground = "#999";
    inactive_tab_background = "#444";
    inactive_tab_font_style = "normal";
    background = "#212121";
    foreground = "#dcdccc";
    color0 = "#4d4d4d";
    color1 = "#fb2573";
    color2 = "#98e123";
    color3 = "#eedfb5";
    color4 = "#45a9d0";
    color5 = "#d190c0";
    color6 = "#1070b0";
    color7 = "#dcdbcd";
    color8 = "#768f81";
    color9 = "#999999";
    color10 = "#c2bfa2";
    color11 = "#ddcfa4";
    color12 = "#9dbdee";
    color13 = "#e097d0";
    color14 = "#a4dee2";
    color15 = "#ffffff";
    scrollback_pager = ''
      ${neovim}/bin/nvim -c "set nonumber nolist showtabline=0 foldcolumn=0" -c "autocmd TermOpen * normal G" -c "silent write! /tmp/kitty_scrollback_buffer | te cat /tmp/kitty_scrollback_buffer - "
    '';
  };

  extraConfig = ''
    map ctrl+j neighboring_window down
    map ctrl+k neighboring_window up
    map ctrl+h neighboring_window left
    map ctrl+l neighboring_window right
    map ctrl+shift+j move_window down
    map ctrl+shift+k move_window up
    map ctrl+shift+h move_window left
    map ctrl+shift+l move_window right
    map ctrl+a>" launch --location=hsplit --cwd=current
    map ctrl+a>% launch --location=vsplit --cwd=current
    map ctrl+a>c new_tab
    map ctrl+a>n next_tab
    map ctrl+a>p previous_tab
    map ctrl+a>w close_tab
    map ctrl+a>, set_tab_title
    map ctrl+a>1 goto_tab 1
    map ctrl+a>2 goto_tab 2
    map ctrl+a>3 goto_tab 3
    map ctrl+a>4 goto_tab 4
    map ctrl+a>5 goto_tab 5
    map ctrl+a>6 goto_tab 6
    map ctrl+a>7 goto_tab 7
    map ctrl+a>8 goto_tab 8
    map ctrl+a>9 goto_tab 9
    map cmd+v paste_from_clipboard
    map ctrl+shift+v paste_from_clipboard
    map ctrl+a>[ show_scrollback
  '';
}
