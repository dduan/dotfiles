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
if (not vim.fn.filereadable(".editorconfig")) then
    vim.opt.shiftwidth = 4
    vim.opt.tabstop = 4
    vim.opt.softtabstop = 4
end
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

-- suppress the annoying 'match x of y', 'The only match' and 'Pattern not
-- found' messages
-- set shortmess+=cI
vim.opt.shortmess:append({ c = true, I = true })

vim.opt.conceallevel = 2

-- Enable spellcheck for camelCase
vim.opt.spelloptions="camel"

vim.opt.updatetime = 800
