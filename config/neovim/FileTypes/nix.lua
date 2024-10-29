vim.api.nvim_create_autocmd(
    {'BufWritePre'},
    {
        pattern = {'*.nix'},
        callback = format("nixpkgs-fmt")
    }
)
