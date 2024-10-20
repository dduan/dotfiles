if (vim.fn.executable('gofmt') == 1) then
    vim.api.nvim_create_autocmd(
        {'BufWritePost'},
        {
            pattern = {'*.go'},
            callback = function()
                    vim.cmd [[
                    silent !gofmt -w %
                    e
                    ]]
                end
        }
    )
end
