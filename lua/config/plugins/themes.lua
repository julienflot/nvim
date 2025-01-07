return {
    {
        "typicode/bg.nvim", lazy = false
    },
    {
        'f-person/auto-dark-mode.nvim',
        opts = {
            update_interval = 1000,
            set_dark_mode = function()
                vim.api.nvim_set_option_value("background", "dark", {})
                vim.cmd("colorscheme kanagawa-wave")
            end,
            set_light_mode = function()
                vim.api.nvim_set_option_value("background", "light", {})
                vim.cmd("colorscheme catppuccin-latte")
            end,
            fallback = "light"
        }
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        opts = {
            no_italic = false,
            no_bold = false,
            styles = {
                comments = { "italic" },
                keywords = { "bold" }
            },
        }
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            compile = false,
            undercurl = false,
            commentStyle = { italic = true },
            keywordStyle = { italic = true, bold = true },

            overrides = function(colors)
                local theme = colors.theme
                local palette = colors.palette
                return {
                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

                    Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },  -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar = { bg = theme.ui.bg_m1 },
                    PmenuThumb = { bg = theme.ui.bg_p2 },

                    DiagnosticVirtualTextError = { fg = palette.samuraiRed, bg = palette.winterRed },
                    DiagnosticVirtualTextWarn = { fg = palette.roninYellow, bg = palette.winterYellow },
                    DiagnosticVirtualTextInfo = { fg = palette.waveAqua1, bg = palette.winterGreen },
                    DiagnosticVirtualTextHint = { fg = palette.dragonBlue, bg = palette.winterGreen },

                    CmpItemAbbrDeprecated = { fg = "#717C7C", bg = "NONE", strikethrough = true },
                    CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", bold = true },
                    CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", bold = true },
                    CmpItemMenu = { fg = "#727169", bg = "NONE", italic = true },

                    CmpItemKindField = { fg = "#fceff1", bg = "#E46876" },
                    CmpItemKindProperty = { fg = "#fceff1", bg = "#E46876" },
                    CmpItemKindEvent = { fg = "#fceff1", bg = "#E46876" },

                    CmpItemKindText = { fg = "#dfd8e9", bg = "#957FB8" },
                    CmpItemKindKeyword = { fg = "#dfd8e9", bg = "#957FB8" },

                    CmpItemKindConstant = { fg = "#4c301e", bg = "#FFA066" },
                    CmpItemKindConstructor = { fg = "#4c301e", bg = "#FFA066" },
                    CmpItemKindReference = { fg = "#4c301e", bg = "#FFA066" },

                    CmpItemKindFunction = { fg = "#252e40", bg = "#7E9CD8" },
                    CmpItemKindOperator = { fg = "#252e40", bg = "#7E9CD8" },
                    CmpItemKindMethod = { fg = "#252e40", bg = "#7E9CD8" },
                    CmpItemKindValue = { fg = "#252e40", bg = "#7E9CD8" },
                    CmpItemKindEnumMember = { fg = "#252e40", bg = "#7E9CD8" },

                    CmpItemKindInterface = { fg = "#24322f", bg = "#7AA89F" },
                    CmpItemKindStruct = { fg = "#24322f", bg = "#7AA89F" },
                    CmpItemKindClass = { fg = "#24322f", bg = "#7AA89F" },
                    CmpItemKindModule = { fg = "#24322f", bg = "#7AA89F" },
                    CmpItemKindEnum = { fg = "#24322f", bg = "#7AA89F" },

                    CmpItemKindVariable = { fg = "#453a27", bg = "#E6C384" },

                    CmpItemKindUnit = { fg = "#303f3f", bg = "#A3D4D5" },
                    CmpItemKindSnippet = { fg = "#303f3f", bg = "#A3D4D5" },
                    CmpItemKindFolder = { fg = "#303f3f", bg = "#A3D4D5" },
                    CmpItemKindFile = { fg = "#303f3f", bg = "#A3D4D5" },
                }
            end
        }
    }
}
