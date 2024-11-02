return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-ui-select.nvim'
    },
    lazy = false,
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_cursor({})
                }
            },
            pickers = {
                find_files = {
                    -- no_ignore = true,
                }
            },
        })

        telescope.load_extension("scope")
        telescope.load_extension("ui-select")
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fs", "<cmd>Telescope treesitter<cr>" },
        { "<leader>fp", "<cmd>Telescope live_grep<cr>" }, 
        { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
    }
} 
