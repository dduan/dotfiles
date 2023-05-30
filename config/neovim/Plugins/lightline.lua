vim.g.lightline = {
    colorscheme = 'one',
    active = {
        left = {
            { 'paste', 'gitbranch' },
            { 'readonly', 'relativepath', 'modified' }
        },
        right = {
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
    subseparator = {
        left = '',
        right = ''
    }
}
