vim.pack.add({
	-- { src = "https://github.com/Erl-koenig/theme-hub.nvim" },
	{ src = "https://github.com/tinted-theming/tinted-nvim" },
	{ src = "https://github.com/xiyaowong/transparent.nvim" },

	{ src = "https://github.com/nvim-mini/mini.tabline" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- colorscheme
-- require("theme-hub").setup({
-- 	install_dir = vim.fn.stdpath("data") .. "/theme-hub",
-- 	auto_install_on_select = true,
-- 	apply_after_install = true,
-- 	persistent = false,
-- })
require("tinted-colorscheme").setup("base24-papercolor-dark", {
	supports = {
		tinty = false,
		tinted_shell = false,
		live_reload = false,
		transparent = false,
	},
})
-- vim.cmd.colorscheme('base24-papercolor-dark')
require("transparent").setup({
	auto = true,
	extra_groups = {
		"MiniFilesNormal",
		"MiniFilesBorder",
		"MiniFilesBufferDir",
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
		"TelescopeResultNormal",
		"TelescopePreviewNormal",
	},
	excludes = {
		"NormalFloat",
	},
})

require("mini.tabline").setup({
	show_icons = true,
})
require("gitsigns").setup()
