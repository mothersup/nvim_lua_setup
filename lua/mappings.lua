-- File for storing simple keymaps
local kmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

kmap('i', 'jk', '<Esc>', opts)
kmap('n', '<Esc><Esc>', '<cmd>noh<CR>', opts)
-- Saving
kmap('i', '<C-s>', '<Esc><cmd>w<CR>', opts)
kmap('n', '<C-s>', '<cmd>w<CR>', opts)
-- Split and start terminal, not used
kmap('n', '<F2>', '<cmd>w<CR>:10sp+te<CR>', opts)
kmap('i', '<F2>', '<Esc><cmd>w<CR>:10sp+te<CR>', opts)
-- Splits toggle
kmap('n', '<A-h>', '<C-w>h', opts)
kmap('n', '<A-j>', '<C-w>j', opts)
kmap('n', '<A-k>', '<C-w>k', opts)
kmap('n', '<A-l>', '<C-w>l', opts)
kmap('n', '<C-Left>', '<C-w>h', opts)
kmap('n', '<C-Down>', '<C-w>j', opts)
kmap('n', '<C-Up>', '<C-w>k', opts)
kmap('n', '<C-Right>', '<C-w>l', opts)


-- NvimTree
kmap('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', opts)

-- Bufferline
kmap('n', ']b' , '<cmd>BufferLineCycleNext<CR>', opts)
kmap('n', '[b' , '<cmd>BufferLineCyclePrev<CR>', opts)

kmap('n', '<Leader>nf', [[<cmd>lua require("neogen").generate()<CR>]], opts)
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<Leader>nf', ':lua require('neogen').generate()<CR>', opts)

-- Markdown-preview
kmap('n', '<Leader>mp', '<cmd>MarkdownPreview<CR>', opts)

-- Telescope
kmap('n', '<Leader>ff', '<cmd>Telescope find_files<CR>', opts)
kmap('n', '<Leader>fg', '<cmd>Telescope live_grep<CR>', opts)
kmap('n', '<Leader>fb', '<cmd>Telescope buffers<CR>', opts)
kmap('n', '<Leader>fh', '<cmd>Telescope help_tags<CR>', opts)

-- Trouble 
kmap('n', '<Leader>xx', '<cmd>TroubleToggle<CR>', opts)
kmap('n', '<Leader>xw', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
kmap('n', '<Leader>xd', '<cmd>TroubleToggle document_diagnostics<CR>', opts)
--[[
kmap('n', '<Leader>xl', '<cmd>TroubleToggle loclist<cr>', opts )
kmap('n', '<Leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
kmap('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', opts)
--]]

-- symbols-outline
kmap('n', '<C-J>', ':SymbolsOutline<CR>', opts)
