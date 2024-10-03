-- Shared variables
local var noremapsilent = { noremap = true, silent = true }

-- Habit
vim.g.mapleader = ","

-- Search stays in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move while stay in the middle
vim.keymap.set('n', '<C-f>', '<C-f>zzzv')
vim.keymap.set('n', '<C-b>', '<C-b>zzzv')
vim.keymap.set('n', '<C-d>', '<C-d>zzzv')
vim.keymap.set('n', '<C-u>', '<C-u>zzzv')

-- better vertial movement for wrapped lines
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

-- quickly cancel search highlighting
vim.keymap.set('n', '<leader><space>', ':nohlsearch<cr>')

-- Strip all trailing whitespace
vim.keymap.set('n', '<leader>f', ':StripWhitespace<cr>')

-- Replace <Esc> with C-c
vim.keymap.set('i', '<F1>', '<Esc>')
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', ':wa<cr>')

-- I type Wq more often than wq
vim.keymap.set('c', 'Wq', 'wq')

-- Sort lines in alphabetical order
vim.keymap.set('v', '<leader>s', ":'<,'>!sort -f<cr>")

-- Make workflow
vim.keymap.set('n', '<leader>m', function()
    local input = vim.fn.input("make> ")
    if input == nil or input == '' then return end
    vim.opt_local.makeprg = input
end, noremapsilent)
vim.keymap.set('n', '<leader>b', ":AsyncRun -program=make<CR>", normapsilent)
vim.keymap.set('n', '[', ':cprevious<CR>', noremapsilent)
vim.keymap.set('n', ']', ':cnext<CR>', noremapsilent)

-- Quickly insert a timestamp
vim.keymap.set('n', 'tt', 'a<C-R>=strftime("%FT%T%z")<CR><esc>hi:<esc>$')

-- Toggle nvim-tree
vim.keymap.set('n', '<leader>a', ':NvimTreeToggle<cr>')

-- [vim-fugitive]
vim.keymap.set('n', '<leader>w', ':Git<cr>')

-- Telescope
vim.keymap.set('n', '<C-p>', ':Telescope find_files theme=ivy<cr>')
vim.keymap.set('n', '<C-s>', ':Telescope live_grep theme=ivy<cr>')
vim.keymap.set('n', '<C-g>', ':Telescope git_commits theme=ivy<cr>')

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set('i', '<C-j>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<C-k>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-f>', function()
    local copilot_keys = vim.fn["copilot#Accept"]()
    if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
    end
end)

-- Tabs
vim.keymap.set('n', '<', ':BufferPrevious<CR>', noremapsilent)
vim.keymap.set('n', '>', ':BufferNext<CR>', noremapsilent)
vim.keymap.set('n', 'W', ':BufferClose<CR>', noremapsilent)
vim.keymap.set('n', '<leader>1', ':BufferGoto 1<CR>', noremapsilent)
vim.keymap.set('n', '<leader>2', ':BufferGoto 2<CR>', noremapsilent)
vim.keymap.set('n', '<leader>3', ':BufferGoto 3<CR>', noremapsilent)
vim.keymap.set('n', '<leader>4', ':BufferGoto 4<CR>', noremapsilent)
vim.keymap.set('n', '<leader>5', ':BufferGoto 5<CR>', noremapsilent)

-- Disable sql.vim default keymaps
vim.g.omni_sql_no_default_maps = 0

-- Toggle quickfix
vim.keymap.set('n', '<leader><leader>', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and 'cclose' or 'copen'
    vim.cmd('botright '..action)
end, { noremap = true, silent = true })

-- Jump to definition
vim.keymap.set('n', '<leader>j', ':lua vim.lsp.buf.definition()<cr>')

-- LSP Hover
vim.keymap.set('n', '<leader>h', ':lua vim.lsp.buf.hover()<cr>')
