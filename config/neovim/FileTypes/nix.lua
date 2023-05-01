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
