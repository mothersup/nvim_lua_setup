local nvim_lsp = require('lspconfig')

M = {}

M.formatting = function()
	vim.lsp.buf.formatting()
	vim.cmd [[ %s/\r//g ]]
end