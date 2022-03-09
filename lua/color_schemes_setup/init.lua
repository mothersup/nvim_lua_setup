local col_sch = 'kanagawa'

-- Packer rtp does not work, manually append onehalf path
-- vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('data') .. '/site/pack/packer/start/onehalf/vim'

require('color_schemes_setup.color_schemes.' .. col_sch .. '_setup')
vim.cmd [[highlight ColorColumn guibg=White]]