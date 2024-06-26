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

kmap("n", "<Leader>nf", function()
	require("neogen").generate()
end)

-- peek
kmap("n", "<Leader>mp", "<cmd>PeekOpen<CR>")

-- Telescope
kmap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>")
kmap("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>")
kmap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>")
kmap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>")

-- Trouble
kmap("n", "<Leader>xx", "<cmd>TroubleToggle<CR>")
kmap("n", "<Leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
kmap("n", "<Leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")

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

-- knap
-- F5 processes the document once, and refreshes the view
kmap("i", "<F5>", function()
	require("knap").process_once()
end)
kmap("v", "<F5>", function()
	require("knap").process_once()
end)
kmap("n", "<F5>", function()
	require("knap").process_once()
end)

-- F6 closes the viewer application, and allows settings to be reset
kmap("i", "<F6>", function()
	require("knap").close_viewer()
end)
kmap("v", "<F6>", function()
	require("knap").close_viewer()
end)
kmap("n", "<F6>", function()
	require("knap").close_viewer()
end)

-- F7 toggles the auto-processing on and off
kmap("i", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)
kmap("v", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)
kmap("n", "<F7>", function()
	require("knap").toggle_autopreviewing()
end)

-- F8 invokes a SyncTeX forward search, or similar, where appropriate
kmap("i", "<F8>", function()
	require("knap").forward_jump()
end)
kmap("v", "<F8>", function()
	require("knap").forward_jump()
end)
kmap("n", "<F8>", function()
	require("knap").forward_jump()
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
