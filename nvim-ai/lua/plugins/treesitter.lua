local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add({ { src = gh('nvim-treesitter/nvim-treesitter'), version = 'main' } })

-- Install all required parsers
require('nvim-treesitter').install({
  -- Base
  'lua', 'vim', 'vimdoc', 'query', 'markdown', 'bash', 'c', 'html',
  -- Web development
  'javascript', 'typescript', 'tsx', 'css', 'scss',
  -- PHP (Blade is included in PHP parser)
  'php', 'php_only', 'blade',
  -- Go
  'go', 'gosum', 'gomod',
  -- Svelte
  'svelte',
  -- Additional useful parsers
  'json', 'yaml', 'toml', 'dockerfile', 'gitignore', 'gitcommit',
})

-- Simple setup with FileType mappings
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local buf = args.buf
    local filetype = args.match
    
    -- Map filetypes to treesitter languages
    local lang_map = {
      -- Base
      lua = 'lua',
      vim = 'vim',
      markdown = 'markdown',
      bash = 'bash',
      sh = 'bash',
      zsh = 'bash',
      c = 'c',
      html = 'html',
      
      -- JavaScript/TypeScript
      javascript = 'javascript',
      javascriptreact = 'javascript',  -- JSX uses JavaScript parser
      js = 'javascript',
      typescript = 'typescript',
      typescriptreact = 'tsx',  -- TSX uses tsx parser
      ts = 'typescript',
      tsx = 'tsx',
      
      -- CSS
      css = 'css',
      scss = 'scss',
      sass = 'scss',
      less = 'css',
      
      -- PHP
      php = 'php',
      blade = 'blade',
      
      -- Go
      go = 'go',
      gomd = 'gomod',
      gosum = 'gosum',
      
      -- Svelte
      svelte = 'svelte',
      
      -- Configuration files
      json = 'json',
      yaml = 'yaml',
      yml = 'yaml',
      toml = 'toml',
      dockerfile = 'dockerfile',
      gitignore = 'gitignore',
    }
    
    local language = lang_map[filetype]
    if not language then return end
    
    -- Start treesitter for highlighting
    pcall(vim.treesitter.start, buf, language)
    
    -- Enable treesitter-based indentation if available
    local has_indent_query = pcall(vim.treesitter.query.get, language, 'indents')
    if has_indent_query then
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- Optional: Enable additional treesitter features
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function(args)
    local buf = args.buf
    local filetype = vim.bo[buf].filetype
    
    -- Enable folding for specific filetypes (optional)
    local fold_filetypes = {
      javascript = true,
      typescript = true,
      php = true,
      go = true,
      svelte = true,
      css = true,
      html = true,
    }
    
    if fold_filetypes[filetype] then
      -- Uncomment to enable treesitter-based folding
      -- vim.wo[buf].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
      -- vim.wo[buf].foldmethod = 'expr'
    end
  end,
})

-- Add this after the treesitter setup
-- Enable additional PHP features
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'php', 'blade' },
  callback = function(args)
    local buf = args.buf
    -- Enable PHP-specific settings
    vim.bo[buf].tabstop = 4
    vim.bo[buf].shiftwidth = 4
  end,
})

-- Add Go-specific settings
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function(args)
    local buf = args.buf
    -- Go uses tabs, not spaces
    vim.bo[buf].expandtab = false
    vim.bo[buf].tabstop = 4
    vim.bo[buf].shiftwidth = 4
  end,
})