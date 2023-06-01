local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- python
	formatting.autopep8,
	formatting.isort,
	diagnostics.flake8.with({ cwd = vim.loop.cwd }),
	diagnostics.mypy,
	-- latex
	diagnostics.chktex,
	formatting.latexindent.with({
		args = { "-m", "-l" },
	}),
	-- markdown
	diagnostics.markdownlint,
	formatting.prettier,
	-- diagnostics.textlint,
	-- formatting.textlint,
	-- lua
	diagnostics.selene,
	formatting.stylua,
}

null_ls.setup({
	debug = false,
	sources = sources,
})
