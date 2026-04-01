-- nvim/lua/config/lsp/completion.lua
-- Updated blink.cmp configuration for Neovim 0.12+

require("luasnip.loaders.from_vscode").lazy_load()

require("blink.cmp").setup({
  signature = { enabled = true },
  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 500 },
    menu = {
      auto_show = true,
      draw = {
        treesitter = { "lsp" },
        columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
      },
    },
  },
  -- Enable LSP snippet support
  snippets = {
    preset = "luasnip",
  },
  -- Source configuration
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  -- Keymap configuration (preserves your existing cmp keybinds)
  keymap = {
    preset = "default",
    ["<C-n>"] = { "select_next", "fallback" },
    ["<C-p>"] = { "select_prev", "fallback" },
    ["<C-y>"] = { "accept", "fallback" },
    ["<C-e>"] = { "hide", "fallback" },
  },
})
