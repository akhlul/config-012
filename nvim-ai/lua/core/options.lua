local opt = vim.opt

-- Leader key (Must be set before lazy.nvim or mappings load)
vim.g.mapleader = ' '

-- Line numbers and navigation
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.scrolloff = 10

-- Indentation and wrapping
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.breakindent = true -- Kept from old: maintains indentation on wrapped lines

-- Smart search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = 'split' -- Kept from old: live preview for substitutions

-- Visual settings
opt.termguicolors = true
opt.signcolumn = 'yes'
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 1
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 2
opt.concealcursor = ''
opt.confirm = true
opt.synmaxcol = 300
opt.ruler = false
opt.virtualedit = 'block'
opt.winminwidth = 5

-- Whitespace visualization (Kept from old)
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Performance
opt.redrawtime = 10000
opt.maxmempattern = 20000

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand('~/.local/share/nvim/undodir')
opt.updatetime = 250 -- Kept from old: 250ms feels snappier for gitgutter/signcolumn updates
opt.timeoutlen = 300
opt.ttimeoutlen = 0
opt.autoread = true
opt.autowrite = true

-- Behavior and interaction
opt.hidden = true
opt.errorbells = false
opt.backspace = 'indent,eol,start'
opt.autochdir = false
opt.iskeyword:append('-')
opt.path:append('**')
opt.selection = 'exclusive'
opt.mouse = 'a'
opt.splitbelow = true
opt.splitright = true
opt.modifiable = true
opt.encoding = 'UTF-8'

-- Clipboard integration (Optimized conditional version)
opt.clipboard = vim.env.SSH_TTY and '' or 'unnamedplus'