vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

--@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.config").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
	highlight = {
		enable = {},
	},
})
