local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
	return
end

require('lsp_setup.lsp_installer_setup')
require('lsp_setup.null_ls_setup')
