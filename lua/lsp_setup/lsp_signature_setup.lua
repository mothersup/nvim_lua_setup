require('lsp_signature').setup({
    hint_prefix = 't-> ',
    max_height = 8,
    handler_opts = {
        border = 'rounded'
    },
    auto_close_after = 30,
    floating_window = true,
    toggle_key = '<A-x>'
})