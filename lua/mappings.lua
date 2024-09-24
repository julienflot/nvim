local map = function(mode, mapping, cmd)
    opts = {silent = true}
    vim.keymap.set(mode, mapping, cmd, opts)
end

local gitsigns = require("gitsigns")

-- buffer operations
map("n", "<tab>", "<cmd>bnext<cr>")
map("n", "<s-tab>", "<cmd>bprev<cr>")
map("n", "<leader>q", "<cmd>bd %<cr>")
map("n", "<leader>w", "<cmd>w<cr>")
-- misc
map("n", "<leader>ns", "<cmd>source %<cr>")
-- window management
map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
-- git mappings
map("n", "<leader>ghn", gitsigns.next_hunk)
map("n", "<leader>ghp", gitsigns.prev_hunk)
map("n", "<leader>ghK", gitsigns.show)
-- open stuff
map("n", "<leader>of", "<cmd>NvimTreeToggle<cr>")
map("n", "<leader>gdd", "<cmd>DiffviewOpen<cr>")
map("n", "<leader>gdc", "<cmd>DiffviewClose<cr>")

-- terminal bindings
map("t", "<esc>", "<c-\\><c-n>")

-- spells bindings
local toggle_spell = function()
    vim.opt.spell = not vim.opt.spell._value
end
map("n", "<F5>", toggle_spell)
map("n", "<leader>ss", "<cmd>Telescope spell_suggest theme=dropdown<cr>")
