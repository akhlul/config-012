local transparent_enabled = false

function ToggleTransparency()
  transparent_enabled = not transparent_enabled
  if transparent_enabled then
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
  else
    vim.cmd.colorscheme(vim.g.colors_name or "tokyonight-night")
  end
end

vim.keymap.set("n", "<leader>tt", ToggleTransparency, { desc = "Toggle transparency", silent = true })