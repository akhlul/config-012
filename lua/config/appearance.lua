vim.pack.add({
	{ src = "https://github.com/Erl-koenig/theme-hub.nvim" },

	{ src = "https://github.com/nvim-mini/mini.tabline" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

-- colorscheme
require('theme-hub').setup({
    install_dir = vim.fn.stdpath("data") .. "/theme-hub",
    auto_install_on_select = true,
    apply_after_install = true,
    persistent = false,
})

require("mini.tabline").setup({
	show_icons = false,
})
require("gitsigns").setup()
