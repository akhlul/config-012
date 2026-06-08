local map = vim.keymap.set

-- smart line movement (wrap-aware)
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- buffer switching
map("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bnext <bar> bdelete #<CR>", { desc = "Delete buffer" })
map("n", "<leader>bb", ":e #<cr>", { desc = "Switch to last edited buffer" })

-- move lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- goto (helix style)
map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })

-- make current open file as root
map("n", "[0", "<cmd>cd %:h<cr>", { desc = "Set current folder as pwd" })

-- quickfix lists
map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- toggle line wrapping
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Wrap", silent = true })

-- clear highlights
map("n", '<Esc>', '<cmd>nohlsearch<CR>')

-- window navigation
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to upper window" })

-- diagnostic
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- terminal exit
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })