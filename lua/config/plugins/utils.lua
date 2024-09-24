return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function()
            local npairs = require("nvim-autopairs")
            npairs.setup({})

            local Rule = require("nvim-autopairs.rule")
            npairs.add_rule(Rule("$", "$", "typst"))
            npairs.add_rule(Rule("/*", "*/", {"c", "cpp"}))
        end
    },
    {
        "folke/todo-comments.nvim",
        lazy = false,
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    {
        "folke/trouble.nvim",
        lazy = false,
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<cmd>Trouble toggle diagnostics<cr>", },
            { "<leader>xq", "<cmd>Trouble toggle qflist<cr>", },
            { "<leader>xt", "<cmd>Trouble toggle todo<cr>", },
        }
    },
    {
        "tiagovla/scope.nvim",
        lazy = false,
        opts = {}
    },
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({})

            -- enable closing the termial with double touch to escape
            function _G.set_terminal_keymaps()
                vim.api.nvim_buf_set_keymap(0, "n", "<esc>", "<cmd>ToggleTerm<cr>", {noremap = true, silent = true})
            end

            local group = vim.api.nvim_create_augroup("ToggleTerm", {})
            vim.api.nvim_create_autocmd("TermOpen", {
                pattern = "term://*",
                callback = set_terminal_keymaps,
                group = group
            })
        end,
        keys = {
            {"<leader>ot", "<cmd>ToggleTerm direction=float<cr>"},
            {"<leader>oT", "<cmd>ToggleTerm direction=vertical<cr>"},
        }
    },
    {
        'rmagatti/auto-session',
        lazy = false,
        opts = {
            suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
            session_lens = {
                load_on_setup = true,
                previewer = false,
            }
        },
        keys = {
            {"<leader>os", "<cmd>Telescope session-lens<cr>"}
        }
    },
    {
        "j-hui/fidget.nvim",
        opts = {},
    }
}
