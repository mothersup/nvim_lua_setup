local lsp_installer = require('nvim-lsp-installer')
local lsp_setup = require('lsp_setup.lsp_config_setup')


-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = lsp_setup.on_attach,
        capabilities = lsp_setup.capabilities,
    }
	
	if server.name == 'zeta_note' then
		local temp_path = os.getenv('TEMP')
		local zeta_note_path = string.sub(temp_path, 1, -6)
		opts.cmd = {zeta_note_path .. [[\nvim-data\lsp_servers\zeta_note\zeta-note.exe]]}
	end
	
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)