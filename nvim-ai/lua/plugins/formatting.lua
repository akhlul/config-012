local function gh(repo) return 'https://github.com/' .. repo end

-- Use array syntax with curly braces for multiple plugins
vim.pack.add({ gh('stevearc/conform.nvim') })

require('conform').setup({
  notify_on_error = false,
  format_on_save = function(bufnr)
    local enabled_filetypes = {}
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    end
    return nil
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {},
})