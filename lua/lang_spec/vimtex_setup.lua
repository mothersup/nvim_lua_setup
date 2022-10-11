local g = vim.g

g.vimtex_compiler_method = 'arara'
g.vimtex_view_method = 'SumatraPDF'
-- g.vimtex_view_general_viewer = 'SumatraPDF'
g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
g.vimtex_view_general_options_latexmk = '-reuse-instance'
