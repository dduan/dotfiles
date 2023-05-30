vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    filters = {
        dotfiles = true,
    },
    renderer = {
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "⚡︎",
                },
            },
        },
    },
}

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})
