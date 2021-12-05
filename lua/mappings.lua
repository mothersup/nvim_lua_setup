-- File for storing simple keymaps

-- Map helper
local map = function(key)
    -- get the extra options
    local opts = {noremap = true}
    for i, v in pairs(key) do
        if type(i) == 'string' then opts[i] = v end
    end

  -- basic support for buffer-scoped keybindings
    local buffer = opts.buffer
    opts.buffer = nil

    if buffer then
        vim.api.nvim_buf_set_keymap(0, key[1], key[2], key[3], opts)
    else
        vim.api.nvim_set_keymap(key[1], key[2], key[3], opts)
    end
end

map{'i', 'jk', '<Esc>'}
map{'n', '<F2>', ':w<CR>:10sp+te<CR>'}
map{'i', '<F2>', '<Esc>:w<CR>:10sp+te<CR>'}