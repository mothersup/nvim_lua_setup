local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- python
	formatting.autopep8,
	formatting.isort,
	diagnostics.flake8,
	diagnostics.mypy,
	-- latex
	diagnostics.chktex,
	formatting.latexindent.with({
		args = { '-m', '-l' }
	}),
	-- markdown
	diagnostics.markdownlint,
	formatting.prettier 
}

null_ls.setup {
	debug = false,
	sources = sources
}


-- Extra ^M may be generated after formatting
-- %s used to remove ^M

--[[
function _G.formatting() 
    vim.lsp.buf.formatting_sync(nil, 2000)
	if not status_ok then
		print('No newline character introduced')
		return
	end
end
--]]

-- local status_ok, _ = pcall(vim.cmd [[ silent! %s/\r//g ]])


