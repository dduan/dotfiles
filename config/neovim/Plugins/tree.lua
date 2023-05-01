vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function copy_file_to(node)
    local file_src = node['absolute_path']
    -- The args of input are {prompt}, {default}, {completion}
    -- Read in the new file path using the existing file's path as the baseline.
    local file_out = vim.fn.input("Copy to: ", file_src, "file")
    -- Create any parent dirs as required
    local dir = vim.fn.fnamemodify(file_out, ":h")
    vim.fn.system { 'mkdir', '-p', dir }
    -- Copy the file
    vim.fn.system { 'cp', '-R', file_src, file_out }
end

require("nvim-tree").setup {
    filters = {
        dotfiles = true,
    },
    renderer = {
        icons = {
            git_placement = "after",
            glyphs = {
                git = {
                    unstaged = "⚡︎",
                },
            },
        },
    },
    view = {
        mappings = {
            list = {
                { key = "c", action = "copy_file_to", action_cb = copy_file_to },
            }
        }
    }
}

vim.api.nvim_create_autocmd({"QuitPre"}, {
    callback = function() vim.cmd("NvimTreeClose") end,
})
