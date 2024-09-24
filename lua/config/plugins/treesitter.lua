return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            sync_installed = false,
            auto_installed = true,
            ensure_installed = { "c", "rust", "lua", "vimdoc" },
            highlight = {
                enable = true,
                disable = { "typst" }
            }
        })
    end
}
