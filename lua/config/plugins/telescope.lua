return {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope-ui-select.nvim'
    },
    lazy = false,
    config = function()
        local telescope = require("telescope")
        local themes = require("telescope.themes")
        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    themes.get_cursor({})
                }
            },
            defaults = themes.get_ivy ({
                layout_config = {
                    height = 0.25
                },
            }),
            pickers = {
                buffers = {
                    preview = false ,
                },
            },
        })

        telescope.load_extension("scope")
        telescope.load_extension("ui-select")
    end,
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>" },
        { "<leader>fs", "<cmd>Telescope treesitter<cr>" },
        { "<leader>fp", "<cmd>Telescope live_grep<cr>" }, 
        { "<leader>fh", "<cmd>Telescope help_tags theme=ivy<cr>" },
    }
} 
