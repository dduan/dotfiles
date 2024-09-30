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
        lualine_c = {
            relative_path,
            {
                'diagnostics',
                update_in_insert = true,
            },
        },
        lualine_x = {
            'encoding',
            {
                'filetype',
                icon_only = true,
            },
        },
        lualine_y = {
            'progress',
            '%c',
        },
        lualine_z = {'searchcount'},
    },
    extensions = {'fugitive', 'nvim-tree', 'quickfix'},
}
