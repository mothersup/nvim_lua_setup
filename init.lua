-- Set language to Eng
vim.cmd([[language en_US]])

require('impatient')
require('plugins')

require('settings')

require('startup_setup')
require('lsp_setup')
require('treesitter_setup')
require('cmp_setup')
require('telescope_setup')
require('surround_setup')
require('range_highlight_setup')
require('autopairs_setup')
require('bufferline_setup')
require('comments_setup')
require('fterm_setup')
require('colorizor_setup')
require('status_line_setup')
require('goto_preview_setup')
-- require('symbol_outline_setup')
require('nvim_tree_setup')
require('shade_setup')
require('color_schemes_setup')
require('indent_blank_setup')

require('vimtex_setup')

require('mappings')

require('better_esc_setup')

-- require('zen_mode_setup')
-- require('nvim-web-devicons').setup()
-- require('mini_setup')
-- require('glow_setup')
-- require('feline_setup')
-- require('toggleterm_setup')