-- [[ Neovim 0.12+ Configuration with vim.pack.add ]]
-- No pcall - plugins load in correct order

local map = vim.keymap.set
local opt = vim.opt

-- ============================================================================
-- Options
-- ============================================================================

opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 5

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "split"

opt.termguicolors = true
opt.signcolumn = "yes:2"
opt.showmatch = true
opt.matchtime = 2
opt.cmdheight = 0
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0
opt.completeopt = "menu,menuone,noselect,popup"
opt.conceallevel = 2
opt.confirm = true
opt.concealcursor = ""
opt.synmaxcol = 300
opt.ruler = false
opt.virtualedit = "block"
opt.winminwidth = 5
opt.laststatus = 3

opt.redrawtime = 10000
opt.lazyredraw = false
opt.timeoutlen = 300
opt.ttimeoutlen = 0
opt.updatetime = 300

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undolevels = 10000
opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.autoread = true
opt.autowrite = true
opt.hidden = true

opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.autochdir = false
opt.iskeyword:append("-")
opt.path:append("**")
opt.selection = "exclusive"
opt.mouse = "a"
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
opt.splitbelow = true
opt.splitright = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- Keymaps
-- ============================================================================

map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bnext <bar> bdelete #<CR>", { desc = "Delete buffer" })
map("n", "<leader>bb", ":e #<cr>", { desc = "Switch to last buffer" })

map("n", "<A-j>", "<cmd>move +<CR>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>move -2<CR>==", { desc = "Move line up" })
map("v", "<A-j>", ":move '>+1<CR>gv", { desc = "Move selection down" })
map("v", "<A-k>", ":move '<-2<CR>gv", { desc = "Move selection up" })

map("n", "gl", "$", { desc = "Go to line end" })
map("n", "gh", "^", { desc = "Go to line start" })

map("n", "[0", "<cmd>cd %:h<CR>", { desc = "Set current folder as pwd" })

map("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix" })
map("n", "[q", "<cmd>cprev<CR>", { desc = "Previous quickfix" })

map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })
map("n", "<leader>tt", "<cmd>TransparentToggle<CR>", { desc = "Toggle transparency" })
map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })

map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "References" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })

-- ============================================================================
-- Plugins (vim.pack.add)
-- ============================================================================

-- Core editing
vim.pack.add({ "https://github.com/nvim-mini/mini.pairs" })
vim.pack.add({ "https://github.com/nvim-mini/mini.comment" })

-- Appearance
vim.pack.add({ "https://github.com/tinted-theming/tinted-nvim" })
vim.pack.add({ "https://github.com/xiyaowong/transparent.nvim" })
vim.pack.add({ "https://github.com/nvim-mini/mini.icons" })
vim.pack.add({ "https://github.com/nvim-mini/mini.tabline" })
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

-- Treesitter
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

-- Workflow
vim.pack.add({ "https://github.com/nvim-mini/mini.files" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope.nvim" })
vim.pack.add({ "https://github.com/nvim-telescope/telescope-ui-select.nvim" })
vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/MunifTanjim/nui.nvim" })
vim.pack.add({ "https://github.com/nvim-neo-tree/neo-tree.nvim" })
vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })

-- LSP
vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
vim.pack.add({ "https://github.com/jwalton512/vim-blade" })

-- Completion (nvim-cmp)
vim.pack.add({ "https://github.com/hrsh7th/nvim-cmp" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-nvim-lsp" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-buffer" })
vim.pack.add({ "https://github.com/hrsh7th/cmp-path" })
vim.pack.add({ "https://github.com/L3MON4D3/LuaSnip" })
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets" })
vim.pack.add({ "https://github.com/saadparwaiz1/cmp_luasnip" })

-- Svelte
vim.pack.add({ "https://github.com/leafOfTree/vim-svelte-plugin" })
vim.g.vim_svelte_plugin_load_full_syntax = 1

-- ============================================================================
-- Plugin Configurations
-- ============================================================================

-- Treesitter
-- require("nvim-treesitter.configs").setup({
--   ensure_installed = {
--     "lua", "vim", "vimdoc", "query",
--     "javascript", "typescript", "tsx",
--     "html", "css", "json",
--   },
--   highlight = { enable = true },
--   indent = { enable = true },
-- })
-- vim.api.nvim_create_autocmd("FileType", {
-- 	callback = function(args)
-- 		local lang = vim.treesitter.language.get_lang(args.match)
-- 		if lang and vim.treesitter.get_parser(args.buf, lang, { error = false }) then
-- 			vim.treesitter.start(args.buf, lang)
-- 		end
-- 	end,
-- })
-- Minimal Treesitter autocmd with confirmation before installing
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        local lang = vim.treesitter.language.get_lang(args.match)
        if not lang then
            return
        end
        
        local has_parser = pcall(vim.treesitter.get_parser, args.buf, lang, { error = false })
        
        if not has_parser then
            local choice = vim.fn.confirm(
                string.format("Install treesitter parser for '%s'?", lang),
                "&Yes\n&No",
                1
            )
            
            if choice == 1 then
                vim.notify(string.format("Installing %s...", lang))
                pcall(require("nvim-treesitter.install").update, { with_sync = true }, lang)
                pcall(vim.treesitter.start, args.buf, lang)
            else
                vim.bo[args.buf].syntax = "on"
            end
        else
            pcall(vim.treesitter.start, args.buf, lang)
        end
    end,
})


-- Colorscheme
require("tinted-nvim").setup({
	default_scheme = "base24-papercolor-dark",
	apply_scheme_on_startup = true,
	ui = {
		transparent = false,
	},
	selector = {
		enabled = false,
	},
})

-- Transparency
require("transparent").setup({
	auto = true,
	extra_groups = {
		"MiniFilesNormal",
		"MiniFilesBorder",
		"MiniFilesBufferDir",
		"TelescopeNormal",
		"TelescopeBorder",
		"TelescopePromptNormal",
	},
	excludes = { "NormalFloat" },
})

-- Mini Icons
require("mini.icons").setup()

-- Mini Tabline
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
		local first_buf = nil
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

-- Gitsigns
require("gitsigns").setup({
	signs = {
		add = { text = "│" },
		change = { text = "│" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
	},
})

-- Mini Pairs & Comment
require("mini.pairs").setup()
require("mini.comment").setup()

-- Mini Files
local function toggle_minifiles()
	if not MiniFiles.close() then
		MiniFiles.open()
	end
end
require("mini.files").setup()
map("n", "--", toggle_minifiles, { desc = "Toggle mini.files" })

-- Neo-tree
require("neo-tree").setup({
	sources = { "filesystem", "buffers", "git_status" },
	filesystem = { hijack_netrw_behavior = "disabled" },
})
map("n", "-0", "<cmd>Neotree filesystem reveal left toggle<CR>", { desc = "Neo-tree left" })
map("n", "-=", "<cmd>Neotree filesystem reveal right toggle<CR>", { desc = "Neo-tree right" })

-- ToggleTerm
require("toggleterm").setup({
	size = 20,
	open_mapping = "~~",
	start_in_insert = true,
	direction = "float",
	float_opts = { border = "curved" },
})
map("t", "~~", "<C-\\><C-n>", { desc = "Exit terminal" })

-- Telescope
require("telescope").setup({
	defaults = {
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		winblend = 10,
		border = true,
	},
	extensions = { ["ui-select"] = { require("telescope.themes").get_dropdown() } },
})
require("telescope").load_extension("ui-select")

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })

-- Mason & LSP
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "jsonls", "intelephense" },
	automatic_installation = false,
})

-- LSP configuration (nvim 0.12 native)
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim", "require" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("ts_ls", {
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
})

vim.lsp.config("html", { filetypes = { "html" } })
vim.lsp.config("cssls", { filetypes = { "css", "scss", "less" } })
vim.lsp.config("jsonls", { filetypes = { "json" } })
vim.lsp.config("intelephense", { filetypes = { "php", "blade" } })

-- Auto-enable LSP
local servers = { "lua_ls", "ts_ls", "html", "cssls", "jsonls", "intelephense" }
for _, server in ipairs(servers) do
	vim.lsp.enable(server)
end

-- Explicitly map .blade.php extensions
vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})

-- Completion (nvim-cmp)
local cmp = require("cmp")
local luasnip = require("luasnip")
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
})

-- ============================================================================
-- Diagnostics
-- ============================================================================

local palette = { err = "#51202A", warn = "#3B3B1B", info = "#1F3342", hint = "#1E2E1E" }

vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
vim.api.nvim_set_hl(0, "DiagnosticWarnLine", { bg = palette.warn, blend = 15 })
vim.api.nvim_set_hl(0, "DiagnosticInfoLine", { bg = palette.info, blend = 10 })
vim.api.nvim_set_hl(0, "DiagnosticHintLine", { bg = palette.hint, blend = 10 })

vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false,
	float = { border = "rounded", source = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "●",
			[vim.diagnostic.severity.WARN] = "●",
			[vim.diagnostic.severity.INFO] = "●",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
	linehl = {
		[vim.diagnostic.severity.ERROR] = "DiagnosticErrorLine",
		[vim.diagnostic.severity.WARN] = "DiagnosticWarnLine",
		[vim.diagnostic.severity.INFO] = "DiagnosticInfoLine",
		[vim.diagnostic.severity.HINT] = "DiagnosticHintLine",
	},
})

local function diag_goto(next, severity)
	return function()
		vim.diagnostic.jump({
			count = next and 1 or -1,
			float = true,
			severity = severity and vim.diagnostic.severity[severity] or nil,
		})
	end
end

map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "]d", diag_goto(true), { desc = "Next diagnostic" })
map("n", "[d", diag_goto(false), { desc = "Prev diagnostic" })
map("n", "]e", diag_goto(true, "ERROR"), { desc = "Next error" })
map("n", "[e", diag_goto(false, "ERROR"), { desc = "Prev error" })
map("n", "]w", diag_goto(true, "WARN"), { desc = "Next warning" })
map("n", "[w", diag_goto(false, "WARN"), { desc = "Prev warning" })

-- ============================================================================
-- Autocommands
-- ============================================================================

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function(event)
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
	end,
})

-- ============================================================================
-- GUI (Neoray)
-- ============================================================================

if vim.g.neoray then
	vim.opt.guifont = "Maple Mono NF:h14"

	local function change_font(delta)
		local font = vim.o.guifont
		local base, size = font:match("(.+):h(%d+)")
		if size then
			local new = math.max(8, tonumber(size) + delta)
			vim.opt.guifont = base .. ":h" .. new
		end
	end

	map("n", "<C-0>", "<cmd>set guifont=Maple\\ Mono\\ NF:h14<CR>", { desc = "Reset font" })
	map("n", "<C-+>", function()
		change_font(1)
	end, { desc = "Increase font" })
	map("n", "<C-->", function()
		change_font(-1)
	end, { desc = "Decrease font" })

	vim.cmd([[
    NeoraySet CursorAnimTime 0.08
    NeoraySet Transparency 0.9
  ]])
end
