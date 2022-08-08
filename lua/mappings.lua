-- File for storing simple keymaps
local kmap = vim.keymap.set
-- local opts = { noremap = true, silent = true }

kmap('i', 'jk', '<Esc>')
kmap('n', '<Esc><Esc>', '<cmd>noh<CR>')
-- Saving
kmap('i', '<C-s>', '<Esc><cmd>w<CR>')
kmap('n', '<C-s>', '<cmd>w<CR>')
-- Splits toggle
kmap('n', '<A-h>', '<C-w>h')
kmap('n', '<A-j>', '<C-w>j')
kmap('n', '<A-k>', '<C-w>k')
kmap('n', '<A-l>', '<C-w>l')
kmap('n', '<C-Left>', '<C-w>h')
kmap('n', '<C-Down>', '<C-w>j')
kmap('n', '<C-Up>', '<C-w>k')
kmap('n', '<C-Right>', '<C-w>l')


-- NvimTree
kmap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>')

-- Bufferline
kmap('n', ']b' , '<cmd>BufferLineCycleNext<CR>')
kmap('n', '[b' , '<cmd>BufferLineCyclePrev<CR>')

kmap('n', '<Leader>nf', function() require("neogen").generate() end)
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<Leader>nf', ':lua require('neogen').generate()<CR>', opts)

-- Markdown-preview
kmap('n', '<Leader>mp', '<cmd>MarkdownPreview<CR>')

-- Telescope
kmap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>')
kmap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>')
kmap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>')
kmap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>')

-- Trouble 
kmap('n', '<Leader>xx', '<cmd>TroubleToggle<CR>')
kmap('n', '<Leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>')
kmap('n', '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>')
--[[
kmap('n', '<Leader>xl', '<cmd>TroubleToggle loclist<cr>', opts )
kmap('n', '<Leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
kmap('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', opts)
--]]

-- symbols-outline
kmap('n', '<C-J>', ':SymbolsOutline<CR>')

-- lazygit
kmap('n', '<Leader>gg', '<cmd>LazyGit<CR>')

-- null-ls
kmap({'i', 'n'}, '<leader>lf', function()
	vim.lsp.buf.formatting_sync(nil, 2000)
    local status_ok, _ = pcall(vim.cmd [[ silent! %s/\r//g ]])
	if not status_ok then
		print('No newline character introduced')
		return
	end
end)

