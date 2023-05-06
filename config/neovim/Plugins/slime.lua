vim.g.slime_target = "tmux"
vim.g.slime_paste_file = '/tmp/slime_paste'
vim.g.slime_default_config = {
    ["socket_name"] = vim.api.nvim_eval('get(split($TMUX, ","), 0)'),
    ["target_pane"] = "{last}"
}
vim.g.slime_dont_ask_default = 1
