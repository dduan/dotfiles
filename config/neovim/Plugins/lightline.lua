vim.g.lightline = {
    colorscheme = 'one',
    active = {
        left = {
            { 'paste', 'spell', 'gitbranch' },
            { 'readonly', 'relativepath', 'modified' }
        },
        right = {
            { 'percent', 'column' },
            { 'fileencoding', 'filetype' }
        }
    },
    component = {
        column = "C%c",
    },
    component_function = {
        gitbranch = 'FugitiveHead',
    },
    subseparator = {
        left = '',
        right = ''
    }
}
