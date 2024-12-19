require("oil").setup({
    delete_to_trash = true,
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["-"] = { "actions.parent", mode = "n" },
    },
    use_default_keymaps = false,
})
