local signs = {
    Error = " ",
    Warn = " ",
    Hint = " ",
    Info = " "
}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- user command for toggling auto formatting on save
vim.api.nvim_create_user_command("FormatToggle", function(_)
    vim.g.disable_auto_format = not vim.g.disable_auto_format
    vim.b.disable_auto_format = not vim.b.disable_auto_format
end, {
    desc = "Toggle auto formattings",
    bang = false
})

local function on_attach(_, bufnr)
    -- little helper for keymaps
    local map = function(keybinding, action)
        vim.keymap.set("n", keybinding, action, { silent = true, buffer = bufnr })
    end

    local builtin_telescope = require('telescope.builtin')

    map("gd", vim.lsp.buf.definition)
    map("gD", builtin_telescope.lsp_definitions)
    map("<leader>gi", builtin_telescope.lsp_implementations)
    map("<leader>lr", builtin_telescope.lsp_references)
    map("<leader>lf", vim.lsp.buf.format)
    map("<leader>la", vim.lsp.buf.code_action)
    map("<leader>li", "<cmd>LspInfo<cr>")
    map("<F2>", vim.lsp.buf.rename)
    map("K", vim.lsp.buf.hover)
end

return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = true
    },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind.nvim'
        },
        config = function()
            -- Setup nvim-cmp.
            local cmp = require 'cmp'

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete({})),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    ['<Tab>'] = cmp.mapping.select_next_item(),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                },
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }),
                -- display icons in completion popup
                window = {
                    completion = {
                        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                        col_offset = -3,
                        side_padding = 0,
                    },
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry,
                            vim_item)
                        local strings = vim.split(kind.kind, "%s", { trimempty = true })
                        kind.kind = " " .. (strings[1] or "") .. " "
                        kind.menu = "    (" .. (strings[2] or "") .. ")"

                        return kind
                    end,
                },
            })

            cmp.setup.cmdline('/', {
                sources = {
                    { name = "buffer" }
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            vim.lsp.config('lua_ls', {
                on_attach = on_attach,
                on_init = function(client)
                    client.config.settings.Lua = {
                        runtime = {
                            version = "LuaJIT",
                            path = {
                                "lua/?.lua",
                                "lua/?/init.lua",
                            }
                        },
                        workspace = {
                            checkThirdParty = true,
                            library = {
                                vim.env.VIMRUNTIME
                            }
                        }
                    }
                end,
                settings = {
                    Lua = {}
                }
            })

            vim.lsp.config('clangd', {
                on_attach = on_attach
            })

            vim.lsp.config('rust_analyzer', {
                on_attach = on_attach
            })

            vim.lsp.config('tinymist', {
                on_attach = on_attach,
                single_file_support = true,
                settings = {
                    semanticTokens = "disable"
                }
            })

            vim.lsp.config('pylsp', {
                on_attach = on_attach
            })
        end
    },
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                javascript = { "prettier" }
            },
            format_on_save = function(bufnr)
                if vim.g.disable_auto_format or vim.b[bufnr].disable_auto_format then
                    return
                else
                    return { lsp_format = "fallback" }
                end
            end
        },
    },
    on_attach = on_attach
}
