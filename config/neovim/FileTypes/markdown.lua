-- Markdown no folding
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal_code_blocks = 0

-- Disable LSP
vim.api.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = { "*.md", "*.markdown" },
        callback = function()
            require("cmp").setup.buffer {
                completion = { autocomplete = false }
            }
        end,
    }
)
