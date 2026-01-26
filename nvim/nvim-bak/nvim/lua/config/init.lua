-- Load all configuration modules

require("config.options")
require("config.keymaps")

-- require("config.plugins")
require("config.editing")
require("config.workflow")
require("config.appearance")
require("config.treesitter")

-- lazzied
require("config.lsp")
require("config.diagnostics")

if vim.g.neoray then
  require("gui-config.neoray")
end
