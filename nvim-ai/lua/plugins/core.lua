local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({ gh('NMAC427/guess-indent.nvim') })
require('guess-indent').setup {}

if vim.g.have_nerd_font then
  vim.pack.add({ gh('nvim-tree/nvim-web-devicons') })
end

vim.pack.add({ gh('lewis6991/gitsigns.nvim') })
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}