return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {} 
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        lazy = false,
        opts = {
            options = {
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        color = { gui = "bold" },
                        fmt = function(text)
                            return text:sub(1, 1)
                        end
                    }
                },
                lualine_b = {
                    {
                        'branch',
                        icon = '',
                        color = { gui = "bold" }
                    }, 
                    'diff', 'diagnostics'
                },
                lualine_c = {
                    {"%="},
                    { "buffers" }
                },
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
        }
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            renderer = {
                icons = {
                    show = {
                        git = false
                    }
                }
            }
        }
    },
    {
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
}
