vim.pack.add({
	-- { src = "https://github.com/Erl-koenig/theme-hub.nvim" },
	{ src = "https://github.com/tinted-theming/tinted-nvim" },
	{ src = "https://github.com/xiyaowong/transparent.nvim" },

	{ src = "https://github.com/nvim-mini/mini.icons" },
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

require("mini.icons").setup()

local function get_neotree_width()
	for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "neo-tree" then
			return vim.api.nvim_win_get_width(win)
		end
	end
	return 0
end
require("mini.tabline").setup({
  icons = true,
	format = function(buf_id, label)
		local default_label = MiniTabline.default_format(buf_id, label)
		local n_width = get_neotree_width()
    local bufs = vim.api.nvim_list_bufs()

    local first_buf = -1
    for _, b in ipairs(bufs) do
      if vim.bo[b].buflisted then
        first_buf = b
        break
      end
    end

		if n_width > 0 and buf_id == first_buf then
			return string.rep(" ", n_width + 1) .. default_label
		end

		return default_label
	end,
})

require("gitsigns").setup()
