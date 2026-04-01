-- nvim/lua/config/init.lua
-- Load all configuration modules

require("config.options")
require("config.keymaps")
require("config.autocmds")  -- New: centralized autocmds

require("config.editing")
require("config.workflow")
require("config.appearance")
require("config.treesitter")  -- Updated for arborist

-- Lazy loaded modules
require("config.lsp")
require("config.diagnostics")

if vim.g.neoray then
  require("gui-config.neoray")
end
