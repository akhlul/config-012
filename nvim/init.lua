-- entry point for Neovim configuration
if vim.g.vscode then
  require("gui-config.vscode")
else
  require("config")
end
