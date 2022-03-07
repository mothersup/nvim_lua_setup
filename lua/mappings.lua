-- File for storing simple keymaps
local kmap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

kmap('i', 'jk', '<Esc>', opts)
kmap('n', '<Esc><Esc>', '<cmd>noh<CR>', opts)
kmap('i', '<C-s>', '<Esc><cmd>w<CR>', opts)
kmap('n', '<C-s>', '<cmd>w<CR>', opts)
kmap('n', '<F2>', ':w<CR>:10sp+te<CR>', opts)
kmap('i', '<F2>', '<Esc>:w<CR>:10sp+te<CR>', opts)

-- NvimTree
kmap('n', '<C-n>', ':NvimTreeToggle<CR>', opts)

-- Bufferline
kmap('n', '[b' , ':BufferLineCycleNext<CR>', opts)
kmap('n', 'b]' , ':BufferLineCyclePrev<CR>', opts)

kmap('n', '<Leader>nf', ':lua require("neogen").generate()<CR>', opts)
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)

-- Markdown-preview
kmap('n', '<Leader>mp', '<cmd>MarkdownPreview<CR>', opts)
