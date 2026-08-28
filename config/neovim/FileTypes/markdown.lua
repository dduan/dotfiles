-- Markdown no folding
vim.g.vim_markdown_folding_disabled = 1
vim.g.vim_markdown_conceal_code_blocks = 0

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(args)
        vim.treesitter.stop(args.buf)
        vim.bo[args.buf].syntax = "markdown"
    end,
})

