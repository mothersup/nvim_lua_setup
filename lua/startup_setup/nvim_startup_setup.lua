--[[
local status_ok, nvim_startup = pcall(require, 'startup.nvim')
if not status_ok then
    return
end
--]]

require('startup').setup({
    theme = 'dashboard'
})