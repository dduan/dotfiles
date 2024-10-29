vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_create_autocmd(
    { "BufWritePre" },
    {
        pattern = { "*.templ" },
        callback = format("templ fmt")
    }
)
