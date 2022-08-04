require('colors_setup.colorizor_setup')
require('colors_setup.transparent_setup')

local col_sch = 'catppuccin'

-- Packer rtp does not work, manually append onehalf path
-- vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('data') .. '/site/pack/packer/start/onehalf/vim'

require('colors_setup.color_schemes.' .. col_sch .. '_setup')
vim.cmd [[highlight ColorColumn guibg=White]]
