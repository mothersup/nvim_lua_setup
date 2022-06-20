local fterm = require('FTerm')
local kmap = vim.keymap.set
local ccmd = vim.api.nvim_create_user_command
local opts = { noremap = true, silent = true }

-- fterm.setup({})

fterm.setup({
    border = 'rounded',
    cmd = 'fish', 
    dimensions  = {
        height = 0.9,
        width = 0.9,
    },
    blend = 1,
})

-- Commands for FTerm
kmap({'n', 't'}, '<C-\\>', function() require("FTerm").toggle() end)

ccmd('FTermOpen', require('FTerm').open, { bang = true })
ccmd('FTermClose', require('FTerm').close, { bang = true })
ccmd('FTermExit', require('FTerm').exit, { bang = true })
ccmd('FTermToggle', require('FTerm').toggle, { bang = true })