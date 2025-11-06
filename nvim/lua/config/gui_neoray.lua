local function change_font_size(delta)
	local cur_font = vim.o.guifont
	local base, fsize_str = cur_font:match("(.+):h(%d+)")

	if not fsize_str then
		print("ErrorL could not parse guifont. Ensure it ends with :h<size>")
		return
	end

	local fsize = tonumber(fsize_str)
	local new_fsize = fsize + delta

	if new_fsize < 8 then
		new_fsize = 8
	end

	vim.opt.guifont = base .. ":h" .. tostring(new_fsize)
end

if vim.g.neoray then
	vim.opt.guifont = "Maple\\ Mono\\ NF:h14"

  -- dynamically resize font
  vim.keymap.set("n", "<C-0>", "<cmd>set guifont=Maple\\ Mono\\ NF:h14<cr>", {desc="Reset font size"})
	vim.keymap.set("n", "<C-=>", function()
		change_font_size(1)
	end, {desc="Increase font size"})
	vim.keymap.set("n", "<C-->", function()
		change_font_size(-1)
	end, {desc="Decrease font size"})

	vim.cmd([[
    NeoraySet CursorAnimTime 0.08
    NeoraySet Transparency 0.9
  ]])
end
