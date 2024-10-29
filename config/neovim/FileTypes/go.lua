if (vim.fn.executable('goimports') == 1) then
    vim.api.nvim_create_autocmd(
        {'BufWritePre'},
        {
            pattern = {'*.go'},
            callback = format("goimports -w")
        }
    )
elseif (vim.fn.executable('gofmt') == 1) then
    vim.api.nvim_create_autocmd(
        {'BufWritePre'},
        {
            pattern = {'*.go'},
            callback = format("gofmt -w")
        }
    )
end
