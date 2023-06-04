local relative_path = function()
    local path = vim.fn.expand('%')
    if vim.fn.winwidth(0) > 120 then
        return path
    else
        return vim.fn.pathshorten(path)
    end
end
require('lualine').setup {
    options = {
        theme = 'material',
        globalstatus = true,
    },
    sections = {
        lualine_a = {'branch'},
        lualine_b = {'diff'},
        lualine_c = {relative_path},
        lualine_x = {
            'encoding',
            {
                'filetype',
                icon_only = true,
            },
        },
        lualine_y = {
            {
                'diagnostics',
                update_in_insert = true,
            },
            'searchcount'
        },
        lualine_z = {'progress', '%c'},
    },
    extensions = {'fugitive', 'nvim-tree', 'trouble', 'quickfix'},
}
