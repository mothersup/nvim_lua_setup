local mason = require('mason')
local mason_lsp = require("mason-lspconfig")

mason.setup()
mason_lsp.setup({
    ensure_installed = { 'pyright', 'lua_ls', 'texlab' }
})
