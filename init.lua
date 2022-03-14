-- Set language to Eng
vim.cmd([[language en_US]])

require('impatient')
require('plugins')

require('settings')

require('colors_setup')
require('startup_setup')

require('telescope_setup')
require('treesitter_setup')

require('lsp_setup')

require('status_line_setup')
require('buffer_setup')
require('file_explorer_setup')
require('terminal_setup')

require('editing_setup')
require('comments_setup')

require('lang_spec')

require('mappings')

--[[
vim.cmd [[highlight Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight NonText guibg=NONE ctermbg=NONE]]
vim.cmd [[highlight SignColumn guibg=NONE ctermbg=NONE]]
--]]

-- require('zen_mode_setup')
-- require('nvim-web-devicons').setup()
-- require('mini_setup')
-- require('glow_setup')
-- require('feline_setup')
-- require('toggleterm_setup')
