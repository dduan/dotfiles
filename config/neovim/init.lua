-- Habit
vim.g.mapleader = ","

-- Display hidden characters
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', eol = '¬' }

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- In many terminal emulators the mouse works just fine, thus enable it.
vim.opt.mouse = 'a'

-- Git Gutter always shows
vim.g.signcolumn = 'yes'

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Highlight the line the cursor is on.
vim.opt.cursorline = true

-- show the cursor position all the time
vim.opt.ruler = true

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

-- Column limits
vim.opt.textwidth = 80
vim.opt.colorcolumn = '80'

-- Sort lines in alphabetical order
vim.keymap.set('v', '<leader>s', ":'<,'>!sort -f<cr>")

-- Toggle quickfix windown
vim.keymap.set('n', '<leader><leader>', function()
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    local action = qf_winid > 0 and 'cclose' or 'copen'
    vim.cmd(action)
end)

-- Make workflow
vim.keymap.set('n', '<leader>m', ':let &makeprg=""<left>')
vim.keymap.set('n', '<leader>b', ':cclose<cr>:silent !clear<cr>:make<cr>')
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }

-- [Molokai]
vim.g.molokai_original = 1
vim.cmd [[ colorscheme molokai ]]

-- When the <Enter> key is pressed while the popup menu is visible, it only
-- hides the menu. Use this mapping to close the menu and also start a new
-- line.
-- vim.keymap.set('i', '<cr>', '(pumvisible() ? "<c-y><cr>" : "<cr>")')

-- Quickly insert a timestamp
vim.keymap.set('n', 'tt', '=%strftime("%FT%T")<cr>p=%strftime("%z")<cr>phi:<esc>')
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

-- Toggle nvim-tree
vim.keymap.set('n', '<leader>a', ':NvimTreeToggle<cr>')

-- [vim-fugitive]
vim.keymap.set('n', '<leader>w', ':Git<cr>')

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

-- Markdown table formatting
vim.keymap.set('v', '<leader>t', ':EasyAlign *|<cr>')

-- Jump to definition
vim.keymap.set('n', '<leader>j', ':lua vim.lsp.buf.definition()<cr>')

-- LSP hover
vim.keymap.set('n', '<leader>h', ':lua vim.lsp.buf.hover()<cr>')

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
vim.keymap.set('n', '<C-p>', ':Telescope find_files<cr>')
vim.keymap.set('n', '<C-s>', ':Telescope live_grep<cr>')
vim.keymap.set('n', '<C-g>', ':Telescope git_commits<cr>')

-- No folding
vim.opt.foldenable = false

local function copy_file_to(node)
    local file_src = node['absolute_path']
    -- The args of input are {prompt}, {default}, {completion}
    -- Read in the new file path using the existing file's path as the baseline.
    local file_out = vim.fn.input("Copy to: ", file_src, "file")
    -- Create any parent dirs as required
    local dir = vim.fn.fnamemodify(file_out, ":h")
    vim.fn.system { 'mkdir', '-p', dir }
    -- Copy the file
    vim.fn.system { 'cp', '-R', file_src, file_out }
end

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

require("nvim-tree").setup {
    filters = {
        dotfiles = true,
    },
    renderer = {
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "⚡︎",
                },
            },
        },
    },
    view = {
        mappings = {
            list = {
                { key = "c", action = "copy_file_to", action_cb = copy_file_to },
            }
        }
    }
}
require'lspconfig'.sourcekit.setup{
  cmd = { "sourcekit-lsp" }
}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.zls.setup{}
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
vim.g.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

vim.g.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})
require'nvim-web-devicons'.setup {
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  },
  ["BUILD"] = {
    icon = "",
    color = "#58964E",
    name = "BazelBUILD"
  },
  ["WORKSPACE"] = {
    icon = "",
    color = "#58964E",
    name = "BazelWORKSPACE"
  },
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["xcconfig"] = {
    icon = "",
    color = "#81e043",
    name = "Xcconfig"
  }
 };
}

-- Make vim transparent
vim.cmd [[
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none
]]
