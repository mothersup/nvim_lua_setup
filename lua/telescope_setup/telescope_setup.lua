local actions = require('telescope.actions')
-- local trouble = require('trouble.providers.telescope')
local open_with_trouble = require("trouble.sources.telescope").open

require('telescope').setup({
    defaults = {
        mappings = {
            i = { ['<C-t>'] = open_with_trouble },
            n = { ['<C-t>'] = open_with_trouble },
        },
    },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('lazygit')
