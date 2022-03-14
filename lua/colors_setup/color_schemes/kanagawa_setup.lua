local col_sch_ok_status, kanagawa = pcall(require, 'kanagawa')
if col_sch_ok_status then
    kanagawa.setup({
        -- transparent = true,
    })
end 

vim.cmd [[colorscheme kanagawa]]