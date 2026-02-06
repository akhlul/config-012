vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.files" },

	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" },

	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim" },

	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

-- mini.files
local toggle_minifiles = function ()
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
vim.keymap.set("n", "-0", "<cmd>Neotree filesystem reveal left toggle<CR>", { desc = "Open file explorer (neo-tree)" })
vim.keymap.set("n", "-=", "<cmd>Neotree filesystem reveal right toggle<CR>", { desc = "Open file explorer (neo-tree)" })

-- toggleterm
require("toggleterm").setup({
	on_open = function(term)
		-- vim.keymap.set("t", "¦", "<C-\\><C-n>", { buffer = term.bufnr, silent = true })
		vim.keymap.set("t", "~~", "<C-\\><C-n>", { buffer = term.bufnr, silent = true })
	end,
	terminal_mappings = true,
})
-- vim.keymap.set("n", "¦", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set("n", "~~", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })

-- telescope
require("telescope").load_extension("ui-select")
local builtin = require("telescope.builtin")
function SearchClasses()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Class" },
		prompt_title = "Search Classes",
	})
end

function SearchFunctions()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Function", "Method" },
		prompt_title = "Search Functions",
	})
end

function SearchVariables()
	builtin.lsp_dynamic_workspace_symbols({
		symbols = { "Variable", "Constant" },
		prompt_title = "Search Variables",
	})
end

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope - Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope - Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope - Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope - Help Tags" })
vim.keymap.set("n", "<leader>fcc", SearchClasses, { desc = "Telescope - Search Classes" })
vim.keymap.set("n", "<leader>fcf", SearchFunctions, { desc = "Telescope - Search Functions" })
vim.keymap.set("n", "<leader>fcv", SearchVariables, { desc = "Telescope - Search Variables" })
