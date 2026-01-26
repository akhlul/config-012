local opt = vim.opt

-- line number and navigation
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.scrolloff = 10

-- indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true

-- smart search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- visual settings
opt.termguicolors = true
opt.signcolumn = "yes"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 1
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.confirm = true
opt.concealcursor = ""
opt.synmaxcol = 300
opt.ruler = false
opt.virtualedit = "block"
opt.winminwidth = 5

-- performance
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- file handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.updatetime = 300
opt.timeoutlen = vim.g.vscode and 1000 or 300
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = true

-- Behavior settings
opt.hidden = true -- Allow hidden buffers
opt.errorbells = false -- No error bells
opt.backspace = "indent,eol,start" -- Better backspace behavior
opt.autochdir = false -- Don't auto change directory
opt.iskeyword:append("-") -- Treat dash as part of word
opt.path:append("**") -- include subdirectories in search
opt.selection = "exclusive" -- Selection behavior
opt.mouse = "a" -- Enable mouse support
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
opt.modifiable = true -- Allow buffer modifications
opt.encoding = "UTF-8" -- Set encoding

opt.splitbelow = true
opt.splitright = true


vim.g.mapleader = ' '
