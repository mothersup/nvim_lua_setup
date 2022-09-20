vim.g.catppuccin_flavour = 'latte'

local catppuccin = require('catppuccin')
catppuccin.setup({
    compile = {
        enabled = true,
        path = vim.fn.stdpath("cache") .. "/catppuccin",
    },
    styles = {
        conditionals = {},
    },
    integrations = {
        cmp = true,
        nvimtree = true,
        telescope = true,
        treesitter = true
    }
})

vim.cmd [[ colorscheme catppuccin ]]
