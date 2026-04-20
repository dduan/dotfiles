vim.fn.mkdir(vim.fn.stdpath('cache'), 'p')

require('barbar').setup {
    auto_hide = true,
    animation = false,
    icons = {
        current = { button = 'Ⓧ' },
        inactive = { button = 'Ⓧ' },
    },
}
