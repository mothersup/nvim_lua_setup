local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
	return
end


require('lsp_setup.lsp_installer_setup')
require('lsp_setup.cmp_setup')
require('lsp_setup.null_ls_setup')
require('lsp_setup.trouble_setup')
require('lsp_setup.goto_preview_setup')
require('lsp_setup.nvim_lightbulb_setup')
require('lsp_setup.lsp_signature_setup')
require('lsp_setup.fidget_setup')

-- require('lsp_setup.lsp_line_setup')

