-- Display hidden characters
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', eol = '¬' }

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight the line the cursor is on.
vim.opt.cursorline = true

-- show the cursor position all the time
vim.opt.ruler = true

-- show the column limit
vim.opt.colorcolumn = '80'

vim.opt.termguicolors = true

vim.opt.signcolumn = 'yes'

require('nvim-web-devicons').setup {
 default = true;
 strict = true;
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
 override_by_extension = {
  ["xcconfig"] = {
    icon = "",
    color = "#81e043",
    name = "Xcconfig"
  }
 };
}

require('gruvbox').setup {
    contrast = 'hard'
}
vim.cmd.colorscheme("gruvbox")

-- Make vim transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "TreesitterContext", { bg = "#000000" })

-- Spell checking
vim.api.nvim_set_hl(0, "SpellBad", { sp="red", undercurl=true, fg="none", bg="none", ctermfg="none", ctermbg="none"})
vim.api.nvim_set_hl(0, "SpellCap", { sp="yellow", undercurl=true, fg="none", bg="none", ctermfg="none", ctermbg="none"})
vim.api.nvim_set_hl(0, "SpellRare", { sp="blue", undercurl=true, fg="none", bg="none", ctermfg="none", ctermbg="none"})
vim.api.nvim_set_hl(0, "SpellLocal", { sp="orange", undercurl=true, fg="none", bg="none", ctermfg="none", ctermbg="none"})

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    disable = { "swift", "markdown" },
    additional_vim_regex_highlighting = false,
  },
}

require('gitsigns').setup()
