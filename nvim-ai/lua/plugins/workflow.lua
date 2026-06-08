local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  gh('nvim-mini/mini.files'),
  gh('nvim-lua/plenary.nvim'),
  gh('nvim-telescope/telescope.nvim'),
  gh('nvim-telescope/telescope-ui-select.nvim'),
  gh('MunifTanjim/nui.nvim'),
  gh('nvim-neo-tree/neo-tree.nvim'),
  gh('akinsho/toggleterm.nvim'),
})

-- mini.files
local toggle_minifiles = function()
  if not MiniFiles.close() then
    MiniFiles.open()
  end
end
require("mini.files").setup({})
vim.keymap.set("n", "--", toggle_minifiles, { desc = "Open file explorer (mini.files)" })

-- neo-tree
require("neo-tree").setup({
  sources = { "filesystem", "buffers", "git_status" },
  popup_border_style = "",
  filesystem = {
    hijack_netrw_behavior = "disabled",
  },
})
vim.keymap.set("n", "-0", "<cmd>Neotree filesystem reveal left toggle<CR>", { desc = "Open file explorer (neo-tree) left" })
vim.keymap.set("n", "-=", "<cmd>Neotree filesystem reveal right toggle<CR>", { desc = "Open file explorer (neo-tree) right" })

-- toggleterm
require("toggleterm").setup({
  on_open = function(term)
    vim.keymap.set("t", "~~", "<C-\\><C-n>", { buffer = term.bufnr, silent = true })
  end,
  terminal_mappings = true,
})
vim.keymap.set("n", "~~", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- telescope setup
require("telescope").setup({
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown() },
  },
})
pcall(require('telescope').load_extension, 'ui-select')

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