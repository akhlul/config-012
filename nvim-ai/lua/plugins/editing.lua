local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({ gh('nvim-mini/mini.pairs') })

require("mini.pairs").setup()

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  require('conform').format({ async = true })
end, { desc = "Local Format" })