-- Set language to Eng
vim.cmd([[language en_US]])

require('plugins')

vim.cmd([[colorscheme onedark]])

require('settings')
require('mappings')
require('lsp_setup')
require('cmp_setup')
require('vimtex_setup')
require('treesitter_setup')

-- require('feline_setup')

require('lualine').setup {
   options = {theme = 'oceanicnext'}
}

require('telescope').load_extension('fzf')

-- require('nvim-web-devicons').setup()
-- require('lualine').setup()

-- vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {noremap = true})