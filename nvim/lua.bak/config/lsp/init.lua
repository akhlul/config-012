-- nvim/lua/config/lsp/init.lua
-- Updated LSP configuration for Neovim 0.12+

vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },

  { src = "https://github.com/L3MON4D3/LuaSnip" },
  { src = "https://github.com/rafamadriz/friendly-snippets" },
  { src = "https://github.com/Saghen/blink.cmp" },
})

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
    "vtsls",
    "html",
    "cssls",
    "svelte",
  },
})

-- LSP configurations
require("config.lsp.lua_lsp")
require("config.lsp.html_css")
require("config.lsp.vtsjs")
require("config.lsp.svelte_lsp")

-- Completion
require("config.lsp.completion")

-- Enable LSP semantic tokens (Neovim 0.12+)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("LSPConfig", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
