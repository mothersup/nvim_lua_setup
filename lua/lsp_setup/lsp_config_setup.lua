local nvim_lsp = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local bkmap = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

M = {}

-- Extra ^M may be generated after formatting
-- %s used to remove ^M
function _G.formatting() 
    vim.lsp.buf.formatting_sync(nil, 2000)
    local status_ok, _ = pcall(vim.cmd [[ silent! %s/\r//g ]])
        if not status_ok then
            print('No newline character introduced')
            return
        end
end

local lsp_keymaps = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    bkmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    bkmap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    bkmap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    bkmap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    bkmap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    bkmap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    bkmap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    bkmap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    bkmap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    -- vim.cmd([[ command! Format execute 'lua formatting()' ]])
    bkmap(bufnr, 'n', '<leader>lf', '<cmd>lua formatting()<CR>', opts)
end
	
M.on_attach = function(client, bufnr)
	client.resolved_capabilities.document_formatting = false
	-- if client.config.flags then
	-- 	client.config.flags.allow_incremental_sync	 = true
	-- end 
	lsp_keymaps(bufnr)
end

local caps = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(caps)

return M


