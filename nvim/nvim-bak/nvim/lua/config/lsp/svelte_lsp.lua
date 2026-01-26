vim.pack.add({
	{ src = "https://github.com/leafOfTree/vim-svelte-plugin" },
})

vim.g.vim_svelte_plugin_load_full_syntax = 1
vim.lsp.config("svelte", {
	-- The svelte-language-server handles its own internal JS/TS logic
	settings = {
		svelte = {
			plugin = {
				svelte = {
					format = { enable = true },
				},
			},
		},
	},
})
