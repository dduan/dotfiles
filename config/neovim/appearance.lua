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

-- [Molokai]
vim.g.molokai_original = 1
vim.cmd.colorscheme("molokai")

vim.opt.termguicolors = true

require'nvim-web-devicons'.setup {
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

-- Make vim transparent
vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
