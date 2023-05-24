vim.g.lightline = {
    colorscheme = 'one',
    active = {
        left = {
            { 'paste', 'gitbranch' },
            { 'readonly', 'relativepath', 'modified' }
        },
        right = {
            {
                'linter_errors',
                'linter_warnings',
                'linter_infos',
                'linter_hints',
                'linter_ok'
            },
            { 'spell', 'fileencoding', 'percent', 'column' },
        }
    },
    component = {
        column = "C%c",
        fileencoding = '[%{&fenc!=#""?&fenc:&enc}]',
    },
    component_function = {
        gitbranch = 'FugitiveHead',
    },
    component_expand = {
        linter_hint = 'lightline#lsp#hints',
        linter_infos = 'lightline#lsp#infos',
        linter_warnings = 'lightline#lsp#warnings',
        linter_errors = 'lightline#lsp#errors',
        linter_ok = 'lightline#lsp#ok',
    },
    component_type = {
        linter_hints = 'right',
        linter_infos = 'right',
        linter_warnings = 'warning',
        linter_errors = 'error',
        linter_ok = 'right',
    },
    subseparator = {
        left = '',
        right = ''
    }
}

vim.g["lightline#lsp#indicator_hints"] = "\u{f002} "
vim.g["lightline#lsp#indicator_infos"] ="\u{f129} "
vim.g["lightline#lsp#indicator_warnings"] = "\u{f071} "
vim.g["lightline#lsp#indicator_errors"] = "\u{f05e} "
vim.g["lightline#lsp#indicator_ok"] = "\u{f00c}"
