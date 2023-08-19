local g = vim.g

-- g.vimtex_compiler_silent = true
g.vimtex_quickfix_mode = 0
g.vimtex_syntax_enabled = false
g.vimtex_compiler_method = 'arara'
-- g.vimtex_view_method = 'SumatraPDF'
g.vimtex_view_general_viewer = 'SumatraPDF'
g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

-- vim.o.maplocalleader = ","
-- g.vimtex_view_general_options_latexmk = '-reuse-instance'
--
vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = {"*.tex"},
        command = [[call vimtex#compiler#compile()]]
    }
)
