-- Set language to Eng
vim.cmd([[language en_US]])
vim.cmd([[colorscheme onedark]])

-- require('impatient')
require('plugins')

require('settings')
require('mappings')
require('lsp_setup')
require('cmp_setup')
require('telescope').load_extension('fzf')
require('vimtex_setup')
require('treesitter_setup')
require('autopairs_setup')
require('bufferline_setup')
require('comments_setup')
-- require('toggleterm_setup')
require('fterm_setup')
require('surround_setup')
-- require('mini_setup')

-- require('feline_setup')
require('lualine').setup {
   options = {theme = 'oceanicnext'}
}


-- require('nvim-web-devicons').setup()
