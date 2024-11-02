--
-- OPTIONS CONFIGURATION
--
-- set tab to space with a width of 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- split options
vim.opt.splitright = true
vim.opt.splitbelow = true

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- UI
vim.opt.hls = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.mouse = 'a'
vim.opt.breakindent = true
vim.opt.conceallevel = 2
-- activate numbers
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true

-- save files
vim.opt.swapfile = false
vim.opt.undofile = true

-- spell options
vim.opt.spelllang = {"fr"}

-- recommend options from auto-session
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- enable exrc files
vim.o.exrc = true

-- enable vim filetypes detection
vim.cmd("filetype plugin indent on")

--
-- LOAD PLUGINS
--
require("config.lazy")

-- 
-- MAPPINGS
--
require("mappings")

-- set colorscheme
vim.cmd("colorscheme kanagawa")
