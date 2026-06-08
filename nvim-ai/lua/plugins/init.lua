local function gh(repo) return 'https://github.com/' .. repo end

require('plugins.core')
require('plugins.ui')
-- require('plugins.search')
require('plugins.lsp')
require('plugins.formatting')
require('plugins.completion')
require('plugins.treesitter')
require('plugins.workflow')
require('plugins.editing')
require('plugins.appearance')