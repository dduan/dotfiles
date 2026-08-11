require("avante").setup {
    provider = "codex",
    mappings = {
        ask = "<leader>ea",
        new_ask = "<leader>en",
        zen_mode = "<leader>ez",
        edit = "<leader>ee",
        refresh = "<leader>er",
        focus = "<leader>ef",
        stop = "<leader>eS",
        toggle = {
            default = "<leader>et",
            debug = "<leader>ed",
            selection = "<leader>eC",
            suggestion = "<leader>es",
            repomap = "<leader>eR",
        },
        files = {
            add_current = "<leader>ec",
            add_all_buffers = "<leader>eB",
        },
        select_model = "<leader>e?",
        select_history = "<leader>eh",
        select_acp_model = "<leader>eM",
        select_acp_mode = "<leader>em",
    },
    acp_providers = {
        codex = {
            auth_method = "chatgpt",
        },
    },
}
