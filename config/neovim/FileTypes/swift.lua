if (vim.fn.executable('swift-format') == 1 and vim.fn.filereadable("./.swift-format")) then
    vim.api.nvim_create_autocmd(
        {'BufWritePre'},
        {
            pattern = {'*.swift'},
            callback = format("swift-format format -i --configuration .swift-format")
        }
    )
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "swift",
  callback = function()
    -- Set the errorformat for Swift files
    vim.bo.errorformat = '%f:%l:%c: %trror: %m'
  end,
})
