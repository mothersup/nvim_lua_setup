local status_ok, nvim_startup = pcall(require, 'nvim-startup')
if not status_ok then
    return
end

local temp_path = os.getenv("TEMP")

nvim_startup.setup {
    startup_file = temp_path ..'\\nvim\\nvim-startuptime.log' -- sets startup log path (string)
}