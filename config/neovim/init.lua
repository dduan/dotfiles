-- In many terminal emulators the mouse works just fine, thus enable it.
vim.opt.mouse = 'a'

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- allow backspacing over everything in insert mode
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- read/write file when switching buffers
vim.opt.autowrite = true
vim.opt.autoread = true

-- tab settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Automatic indentation is good
vim.opt.autoindent = true

-- Undo function after reopening
vim.opt.undofile = true
vim.opt.undodir = '/tmp'

-- macOS clipboard sharing
vim.opt.clipboard = 'unnamedplus'

-- accelerated scrolling
vim.opt.scrolljump = -15

vim.opt.formatoptions = 'qrnj1'

-- List candidates in wildmenu after tabbing, complete longest common part in
-- matched results. Tabbing again will trigger selection among the matches.
vim.opt.wildmode = 'list:longest,full'

-- Column limits
vim.opt.textwidth = 80

vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }

-- No folding
vim.opt.foldenable = false

-- [Auto Pairs]
-- Don't be too smart across lines
vim.g.AutoPairsMultilineClose = false
-- Don't insert extra spaces
vim.g.AutoPairsMapSpace = false

-- [Nerdcommenter]
vim.g.NERDCustomDelimiters = {
    nix = { left = '# ' },
    swift = { left = '// ' },
}

vim.g.NERDDefaultAlign = 'left'

-- suppress the annoying 'match x of y', 'The only match' and 'Pattern not
-- found' messages
-- set shortmess+=cI
vim.opt.shortmess:append({ c = true, I = true })

-- Auto-format Nix files
vim.api.nvim_create_autocmd(
    {'BufWritePost'},
    {
        pattern = {'*.nix'},
        callback = function()
            vim.cmd [[
                silent !nixpkgs-fmt %
                e
            ]]
        end
    }
)

-- Auto-run rustfmt
vim.g.rustfmt_autosave = 1

-- Use `check` for default cargo parameter
vim.g.cargo_makeprg_params = 'check'

-- Markdown no folding
vim.g.vim_markdown_folding_disabled = 1

-- Telescope
require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
                ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
            },
            n = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
    },
})

