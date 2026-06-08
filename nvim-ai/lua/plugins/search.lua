-- lua/plugins/search.lua
local function gh(repo) return 'https://github.com/' .. repo end

-- Telescope is already added in workflow.lua, so just configure it here
vim.defer_fn(function()
  local ok, telescope = pcall(require, 'telescope')
  if not ok then return end

  telescope.setup({
    extensions = {
      ['ui-select'] = { require('telescope.themes').get_dropdown() },
    },
  })
  pcall(telescope.load_extension, 'ui-select')

  local builtin = require("telescope.builtin")

  local function SearchClasses()
    builtin.lsp_dynamic_workspace_symbols({
      symbols = { "Class" },
      prompt_title = "Search Classes",
    })
  end

  local function SearchFunctions()
    builtin.lsp_dynamic_workspace_symbols({
      symbols = { "Function", "Method" },
      prompt_title = "Search Functions",
    })
  end

  local function SearchVariables()
    builtin.lsp_dynamic_workspace_symbols({
      symbols = { "Variable", "Constant" },
      prompt_title = "Search Variables",
    })
  end

  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
  vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
  vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
  vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
  vim.keymap.set("n", "<leader>fcc", SearchClasses, { desc = "Search Classes" })
  vim.keymap.set("n", "<leader>fcf", SearchFunctions, { desc = "Search Functions" })
  vim.keymap.set("n", "<leader>fcv", SearchVariables, { desc = "Search Variables" })
end, 100)