require('snippy').setup({
    enable_auto = true,
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            -- ['<S-Tab>'] = 'previous',
            ['<C-L>'] = 'next',
            ['<C-H>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})
