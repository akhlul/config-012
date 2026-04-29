local vscode = require("vscode")

local target = "global"

-- Editor UI
vscode.update_config("editor.minimap.enabled", false, target)
vscode.update_config("editor.renderWhitespace", "none", target)
vscode.update_config("editor.guides.indentation", false, target)
vscode.update_config("editor.renderLineHighlight", "none", target)
vscode.update_config("editor.overviewRulerBorder", false, target)
vscode.update_config("editor.hideCursorInOverviewRuler", true, target)
vscode.update_config("editor.folding", false, target)
vscode.update_config("editor.occurrencesHighlight", false, target)
vscode.update_config("editor.matchBrackets", false, target)
vscode.update_config("editor.glyphMargin", false, target)

-- Workbench UI
vscode.update_config("explorer.openEditors.visible", 0, target)
vscode.update_config("workbench.activityBar.location", "bottom", target)
vscode.update_config("workbench.editor.showIcons", false, target)
vscode.update_config("workbench.editor.tabActionCloseVisibility", false, target)
vscode.update_config("workbench.editor.tabSizing", "fixed", target)
vscode.update_config("workbench.statusBar.visible", true, target)

-- Extension specific & Colors
vscode.update_config("indenticator.color.dark", "rgba(255,255,255,.1)", target)
-- vscode.update_config("workbench.colorCustomizations.tab.activeBorder", "#0000", target)

-- options
vim.opt.clipboard = "unnamedplus"

-- Set leader key to space
vim.g.mapleader = " "

-- Zoom Editor
vim.keymap.set("n", "<leader>+", function()
	vscode.action("editor.action.fontZoomIn")
end)
vim.keymap.set("n", "<leader>=", function()
	vscode.action("editor.action.fontZoomOut")
end)

-- Zoom Terminal (If terminal is active)
vim.keymap.set("n", "<leader>t+", function()
	vscode.action("workbench.action.terminal.fontZoomIn")
end)
vim.keymap.set("n", "<leader>t-", function()
	vscode.action("workbench.action.terminal.fontZoomOut")
end)

-- Toggle focus between explorer and editor
vim.keymap.set("n", "--", function()
	local current = vim.api.nvim_get_current_buf()
	local name = vim.api.nvim_buf_get_name(current)
	if name:match("File Explorer") then
		vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
	else
		vim.fn.VSCodeNotify("workbench.view.explorer")
	end
end)

-- Format editor
vim.keymap.set("n", "<leader>lf", function()
	vim.fn.VSCodeNotify("editor.action.formatDocument")
end)

-- Toggle wrap
vim.keymap.set("n", "<leader>tw", function()
	vim.fn.VSCodeNotify("editor.action.toggleWordWrap")
end)

-- Open Command Palette (Ctrl+Shift+P)
vim.keymap.set("n", "<leader>p", function()
	vim.fn.VSCodeNotify("workbench.action.showCommands")
end)

-- Quick open
vim.keymap.set("n", "<leader>ff", function()
	vim.fn.VSCodeNotify("workbench.action.quickOpen")
end)

-- Grep search (Global Search)
vim.keymap.set("n", "<leader>fg", function()
	vim.fn.VSCodeNotify("workbench.action.findInFiles")
end)

-- Tab navigation
vim.keymap.set("n", "<tab>", function()
	vim.fn.VSCodeNotify("workbench.action.nextEditor")
end)
vim.keymap.set("n", "<s-tab>", function()
	vim.fn.VSCodeNotify("workbench.action.previousEditor")
end)

-- Pane navigation
vim.keymap.set("n", "<leader><tab>", function()
	vim.fn.VSCodeNotify("workbench.action.focusNextGroup")
end)
vim.keymap.set("n", "<leader><s-tab>", function()
	vim.fn.VSCodeNotify("workbench.action.focusPreviousGroup")
end)

-- Select next suggestion
vim.keymap.set('i', '<C-n>', function()
    return vim.fn.pumvisible() == 1 and '<C-n>' or '<C-n>'
end, { expr = true })

-- Select previous suggestion
vim.keymap.set('i', '<C-p>', function()
    return vim.fn.pumvisible() == 1 and '<C-p>' or '<C-p>'
end, { expr = true })

-- Confirm/Accept (Yes)
vim.keymap.set('i', '<C-y>', function()
    return vim.fn.pumvisible() == 1 and '<C-y>' or '<C-y>'
end, { expr = true })

-- Cancel/Close (Exit)
vim.keymap.set('i', '<C-e>', function()
    return vim.fn.pumvisible() == 1 and '<C-e>' or '<C-e>'
end, { expr = true })
