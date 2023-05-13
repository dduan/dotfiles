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
-- If you want insert `(` after select function or method item
local autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  autopairs.on_confirm_done()
)
