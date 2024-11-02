return {
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects", 
        },
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
                },
                indent = {
                    enable = true
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,

                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                        }
                    }
                }
            })
        end
    },
    { 
        "windwp/nvim-ts-autotag",
        opts = {}
    },
}
