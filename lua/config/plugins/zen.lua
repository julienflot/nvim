return {
    "folke/zen-mode.nvim",
    opts = {
        plugins = {
            gitsigns = { enabled = true },
            todo = { enabled = true },
            kitty = { enabled = false },
        }
    },
    keys = {
        {"<leader>zz", "<cmd>ZenMode<cr>"}
    }
}
