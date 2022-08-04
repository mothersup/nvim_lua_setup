vim.g.catppuccin_flavour = 'latte'

local catppuccin = require('catppuccin')
catppuccin.setup()

vim.cmd [[ colorscheme catppuccin ]]
