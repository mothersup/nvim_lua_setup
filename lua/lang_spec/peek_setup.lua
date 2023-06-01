require('peek').setup({
    auto_load = false,
    syntax = false,
    theme = 'light',
})

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
