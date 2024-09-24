-- Don't be too smart across lines
vim.g.AutoPairsMultilineClose = false
-- Don't insert extra spaces
vim.g.AutoPairsMapSpace = false

require("nvim-autopairs").setup {
    fast_wrap = {
        map = '<C-e>',
        end_key = '$',
        keys = '123456789',
    },
}
