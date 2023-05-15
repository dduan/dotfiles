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

-- Better paste
vim.keymap.set('x', 'p', '"_dP')

-- Sort lines in alphabetical order
vim.keymap.set('v', '<leader>s', ":'<,'>!sort -f<cr>")

-- Toggle quickfix windown
vim.keymap.set('n', '<leader><leader>', ":TroubleToggle quickfix<cr>")

-- Make workflow
vim.keymap.set('n', '<leader>m', ':let &makeprg=""<left>')
vim.keymap.set('n', '<leader>b', ':cclose<cr>:silent !clear<cr>:make<cr>')

-- Quickly insert a timestamp
vim.keymap.set('n', 'tt', '=%strftime("%FT%T")<cr>p=%strftime("%z")<cr>phi:<esc>')

-- Toggle nvim-tree
vim.keymap.set('n', '<leader>a', ':NvimTreeToggle<cr>')

-- [vim-fugitive]
vim.keymap.set('n', '<leader>w', ':Git<cr>')

-- Markdown table formatting
vim.keymap.set('v', '<leader>t', ':EasyAlign *|<cr>')

-- Jump to definition
vim.keymap.set('n', '<leader>j', ':lua vim.lsp.buf.definition()<cr>')

-- LSP hover
vim.keymap.set('n', '<leader>h', ':lua vim.lsp.buf.hover()<cr>')

-- Telescope
vim.keymap.set('n', '<C-p>', ':Telescope find_files theme=ivy<cr>')
vim.keymap.set('n', '<C-s>', ':Telescope live_grep theme=ivy<cr>')
vim.keymap.set('n', '<C-g>', ':Telescope git_commits theme=ivy<cr>')

-- toggle keymappings for venn
vim.keymap.set('n', '<leader>d', Toggle_venn)

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
