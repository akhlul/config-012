vim.loader.enable()

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = false

local function gh(repo) return 'https://github.com/' .. repo end

require('core.options')
require('core.keymaps')
require('core.autocmds')
require('plugins.init')
