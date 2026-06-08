local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({ gh('folke/which-key.nvim') })
require('which-key').setup {
  delay = 0,
  icons = { mappings = vim.g.have_nerd_font },
  spec = {
    { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    { 'gr', group = 'LSP Actions', mode = { 'n' } },
  },
}

vim.pack.add({ gh('folke/tokyonight.nvim') })
require('tokyonight').setup {
  styles = {
    comments = { italic = false },
  },
}
vim.cmd.colorscheme 'tokyonight-night'

vim.pack.add({ gh('folke/todo-comments.nvim') })
require('todo-comments').setup { signs = false }

vim.pack.add({ gh('nvim-mini/mini.nvim') })

require('mini.ai').setup {
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()

local statusline = require 'mini.statusline'
statusline.setup { use_icons = vim.g.have_nerd_font }
statusline.section_location = function() return '%2l:%-2v' end

vim.pack.add({ gh('j-hui/fidget.nvim') })
require('fidget').setup {}