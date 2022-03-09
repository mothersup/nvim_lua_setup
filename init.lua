-- Set language to Eng
vim.cmd([[language en_US]])

require('settings')

require('impatient')
require('plugins')

require('startup_setup')
require('treesitter_setup')
require('telescope_setup')
require('lsp_setup')
require('cmp_setup')
require('autopairs_setup')

require('bufferline_setup')
require('comments_setup')
require('fterm_setup')
require('surround_setup')
require('range_highlight_setup')

require('colorizor_setup')

require('lualine').setup {
   options = {theme = 'auto'}
}
require('goto_preview_setup')
-- require('navigator_setup')

require('vimtex_setup')

-- require('toggleterm_setup')
-- require('mini_setup')
-- require('feline_setup')
-- require('glow_setup')

require('mappings')
require('better_esc_setup')

-- require('nvim-web-devicons').setup()

require('kanagawa').setup({
	transparent = true
})

vim.cmd [[colorscheme kanagawa]]
vim.cmd [[highlight ColorColumn ctermbg=lightgrey guibg=lightgrey]]
-- require('color_schemes_setup')

-- goes after color schemes
require('indent_blank_setup')
