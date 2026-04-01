local vscode = require('vscode')

vim.g.mapleader = " "

-- Zoom Editor
vim.keymap.set('n', '<leader>+', function() vscode.action('editor.action.fontZoomIn') end)
vim.keymap.set('n', '<leader>-', function() vscode.action('editor.action.fontZoomOut') end)

-- Zoom Terminal (If terminal is active)
vim.keymap.set('n', '<leader>t+', function() vscode.action('workbench.action.terminal.fontZoomIn') end)
