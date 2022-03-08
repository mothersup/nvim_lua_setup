local col_sch = 'kanagawa'

local col_sch_ok_status, _ = pcall(require, col_sch)
if col_sch_ok_status then
	require('kanagawa').setup({
		transparent = true
	})

    vim.cmd('colorscheme ' .. col_sch)
end 