-- nvim/lua/config/treesitter.lua
-- Using arborist for treesitter management

vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/arborist-ts/arborist.nvim" },
  { src = "https://github.com/arborist-ts/queries" },
})

-- Configure arborist as the treesitter manager
require("arborist").setup({
  -- Automatically install missing parsers
  auto_install = true,
  
  -- Highlight configuration
  highlight = {
    enable = true,
    -- Additional highlight groups
    additional_vim_regex_highlighting = false,
  },
  
  -- Indentation configuration
  indent = {
    enable = true,
  },
  
  -- Ensure these parsers are installed
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "javascript",
    "typescript",
    "tsx",
    "html",
    "css",
    "json",
    "markdown",
    "python",
    "rust",
    "bash",
    "c",
    "cpp",
  },
})

-- Optional: Configure specific language settings
local arborist = require("arborist")

-- Custom highlight settings for specific filetypes
arborist.set_highlight("lua", {
  additional_vim_regex_highlighting = false,
})

arborist.set_highlight("javascript", {
  additional_vim_regex_highlighting = false,
})

-- Enable incremental selection with arborist
local map = vim.keymap.set
map("n", "<leader>ts", function()
  arborist.incremental_selection()
end, { desc = "Incremental selection" })

-- Show treesitter tree (debug)
map("n", "<leader>tt", function()
  arborist.show_tree()
end, { desc = "Show treesitter tree" })
