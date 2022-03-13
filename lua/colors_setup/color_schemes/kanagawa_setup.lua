local col_sch_ok_status, kanagawa = pcall(require, 'kanagawa')
if col_sch_ok_status then
    kanagawa.setup({
        -- transparent = true,
		overrides = {
			-- Normal = { bg = 'None' }
		}
    })
end 

vim.cmd [[colorscheme kanagawa]]