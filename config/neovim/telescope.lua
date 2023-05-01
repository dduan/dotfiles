require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
            },
            n = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
            },
        },
    },
})
