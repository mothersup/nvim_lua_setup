local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
    enabled = function()
        -- disable completion in comments
        local context = require('cmp.config.context')
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment") 
                and not context.in_syntax_group("Comment")
        end 
    end ,

    snippet = {
        expand = function(args)
            -- For `vsnip` user.
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    
    mapping = {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            -- For vsnip users.
            { name = 'vsnip' }, 
        }, 
        {
            { name = 'buffer' },
        }
    -- use lsp_signature instead
    --[[
    {
        { name = 'nvim_lsp_signature_help' },
    }
    --]]
    )
    ,
    
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require('cmp-under-comparator').under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		}
	}, 
    
    formatting = {
        format = lspkind.cmp_format({
            mode = 'text_symbol', 
            maxwidth = 50
        })
    }
})

cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})
