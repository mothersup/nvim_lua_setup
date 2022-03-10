local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- python
	formatting.autopep8,
	formatting.isort,
	diagnostics.flake8,
	-- latex
	diagnostics.chktex,
	formatting.latexindent.with({
		args = { '-m', '-l' }
	}),
	
	formatting.prettier
}

null_ls.setup {
	debug = false,
	sources = sources
}