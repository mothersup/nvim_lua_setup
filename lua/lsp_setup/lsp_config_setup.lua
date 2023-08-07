local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local bkmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

vim.lsp.set_log_level("debug")

local lsp_keymaps = function(bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	bkmap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	bkmap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bkmap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	bkmap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	bkmap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	bkmap(bufnr, "n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	-- bkmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	bkmap(bufnr, "n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	bkmap(bufnr, "n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

local on_attach = function(client, bufnr)
	-- client.resolved_capabilities.document_formatting = false
	-- if client.config.flags then
	-- 	client.config.flags.allow_incremental_sync	 = true
	-- end
	lsp_keymaps(bufnr)
end

-- local caps = vim.lsp.protocol.make_client_capabilities()
-- local capabilities = cmp_nvim_lsp.update_capabilities(caps)
local capabilities = cmp_nvim_lsp.default_capabilities()

nvim_lsp["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

local texlab_name = vim.fn.has("win32") and "texlab" or "texlab.cmd"
nvim_lsp["texlab"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { vim.fn.stdpath("data") .. [[/mason/bin/]] .. texlab_name },
	settings = {
		texlab = {
			build = {
				args = { "%f" },
				executable = "arara",
				forwardSearchAfter = true,
				onSave = true,
			},
			forwardSearch = {
				executable = "zathura",
				args = {
					"--synctex-editor-command",
					[[nvim-texlabconfig -file '%%%{input}' -line %%%{line} -server ]] .. vim.v.servername,
					"--synctex-forward",
					"%l:1:%f",
					"%p",
				},
			},
		},
	},
})

nvim_lsp["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp["elmls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp["html"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp["typst_lsp"].setup({
    -- settings = {
    --     exportPdf = "onSave"
    -- },
	on_attach = on_attach,
	capabilities = capabilities,
})
