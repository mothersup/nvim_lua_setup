-- File for storing simple keymaps
local kmap = vim.keymap.set
local api = vim.api
-- local opts = { noremap = true, silent = true }

-- kmap("i", "jk", "<Esc>")
kmap("n", "<Esc><Esc>", "<cmd>noh<CR>")
-- Saving
kmap("i", "<C-s>", "<Esc><cmd>w<CR>")
kmap("n", "<C-s>", "<cmd>w<CR>")
-- Splits toggle
kmap("n", "<A-h>", "<C-w>h")
kmap("n", "<A-j>", "<C-w>j")
kmap("n", "<A-k>", "<C-w>k")
kmap("n", "<A-l>", "<C-w>l")
kmap("n", "<C-Left>", "<C-w>h")
kmap("n", "<C-Down>", "<C-w>j")
kmap("n", "<C-Up>", "<C-w>k")
kmap("n", "<C-Right>", "<C-w>l")

-- NvimTree
kmap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

-- Bufferline
kmap("n", "]b", "<cmd>BufferLineCycleNext<CR>")
kmap("n", "[b", "<cmd>BufferLineCyclePrev<CR>")

-- neogen
kmap("n", "<Leader>nf", function()
	require("neogen").generate()
end)

-- tiny-code-action
kmap("n", "<Leader>ca", function()
    require("tiny-code-action").code_action()
end)

-- peek
kmap("n", "<Leader>mp", "<cmd>PeekOpen<CR>")

-- Telescope
kmap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
kmap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
kmap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
kmap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")
kmap("n", "<Leader>fr", "<cmd>Telescope resume<CR>")

-- Trouble
kmap("n", "<Leader>xx", "<cmd>Trouble diagnostics toggle<CR>")
kmap("n", "<Leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>")
kmap("n", "<Leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>")
kmap("n", "<Leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>")
kmap("n", "<Leader>xl", "<cmd>Trouble loclist toggle<CR>")
kmap("n", "<Leader>xQ", "<cmd>Trouble qflist toggle<CR>")
-- kmap("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
-- kmap("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")

-- symbols-outline
kmap("n", "<C-J>", ":SymbolsOutline<CR>")

-- lazygit
kmap("n", "<Leader>gg", "<cmd>LazyGit<CR>")

-- null-ls
kmap({ "i", "n" }, "<leader>lf", function()
	vim.lsp.buf.format({async = true})
	local status_ok, _ = pcall(vim.cmd([[ silent! %s/\r//g ]]))
	if not status_ok then
		print("No newline character introduced")
		return
	end
end)

vim.api.nvim_create_autocmd("BufUnload", {
	pattern = "*",
	callback = function()
		if vim.b.knap_viewerpid then
			os.execute("pkill -f live-server")
		end
	end,
	desc = "kill live-server upon exiting if knap is running",
})

-- trevJ
kmap("n", "<leader>tj", function()
	require("trevj").format_at_cursor()
end)

api.nvim_create_user_command('Wab', function ()
    cur_buf = api.nvim_get_current_buf()
    cur_pos = api.nvim_win_get_cursor(0)
    api.nvim_command('bufdo w')
    api.nvim_win_set_buf(0, cur_buf)
    api.nvim_win_set_cursor(0, cur_pos)
    -- print(cur_buf)
    -- print(cur_pos)
end, {} )
