return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {},
        keys = {
            {"<leader>ghu", "<cmd>Gitsigns reset_hunk<cr>"},
            {"<leader>ghn", "<cmd>Gitsigns next_hunk<cr>"},
            {"<leader>ghp", "<cmd>Gitsigns prev_hunk<cr>"},
            {"<leader>ghK", "<cmd>Gitsigns preview_hunk<cr>"},
            {"<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>"},
        }
    },
    {
        "tpope/vim-fugitive"
    },
    {
        "sindrets/diffview.nvim",
        opts = {}
    }
}
