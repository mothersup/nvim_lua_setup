local fterm = require('FTerm')
local kmap = vim.api.nvim_set_keymap
local bkmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

fterm.setup {
    border = 'rounded',
    cmd = [[ pwsh -NoLogo ]], 
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
    blend = 1,
}

-- Commands for FTerm
vim.cmd [[ command! FTermOpen lua require("FTerm").open() ]]
vim.cmd [[ command! FTermClose lua require("FTerm").close() ]]
vim.cmd [[ command! FTermToggle lua require("FTerm").toggle() ]]
vim.cmd [[ command! FTermExit lua require("FTerm").exit() ]]

kmap('n', '<C-\\>', '<cmd>FTermToggle<CR>', opts)
kmap('t', '<C-\\>', [[ <C-\><C-n><cmd>FTermToggle<CR> ]], opts)

-- Set bindings for terminal,
-- Copied from toggleTerm
function _G.set_terminal_mappings()
    bkmap(0, 't', '<esc>', [[ <C-\><C-n> ]], opts)
    bkmap(0, 't', 'jk', [[ <C-\><C-n> ]], opts)
    bkmap(0, 't', '<C-h>', [[ <C-\><C-n><C-w>h ]], opts)
    bkmap(0, 't', '<C-j>', [[ <C-\><C-n><C-w>j ]], opts)
    bkmap(0, 't', '<C-k>', [[ <C-\><C-n><C-w>k ]], opts)
    bkmap(0, 't', '<C-l>', [[ <C-\><C-n><C-w>l ]], opts)
end

vim.cmd [[ autocmd! TermOpen term://* lua set_terminal_mappings() ]]