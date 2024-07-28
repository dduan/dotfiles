vim.api.nvim_create_autocmd(
    {
        "BufNewFile",
        "BufRead",
    },
    {
        pattern = { "*.swift" },
        callback = function()
            vim.api.nvim_buf_set_option(
                vim.api.nvim_get_current_buf(),
                "errorformat",
                table.concat(
                    {
                        "%E%f:%l:%c: %trror: %m",
                        "%W%f:%l:%c: %tarning: %m",
                        "%I%f:%l:%c: note: %m",
                        "%E%f:%l: %trror: %m",
                        "%W%f:%l: %tarning: %m",
                        "%I%f:%l: note: %m",
                    },
                    ","
                )
            )
        end,
    }
)
if (vim.fn.executable('swift-format') == 1 and vim.fn.filereadable("./.swift-format")) then
    vim.api.nvim_create_autocmd(
        {'BufWritePost'},
        {
            pattern = {'*.swift'},
            callback = function()
                    vim.cmd [[
                    silent !swift-format format -i --configuration .swift-format %
                    e
                    ]]
                end
        }
    )
end
