-- File for vim set

-- Setup alias
local o = vim.o 

-- Set encoding to utf-8
o.encoding = 'utf-8'

-- Enable mouse
o.mouse = 'a'

-- Syntax highlighting
o.syntax = 'on'

-- Autocomplete related 
o.completeopt = "menuone,noselect,"

-- Tap and indent related
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.autoindent = true
o.smartindent = true

-- Display relative line number 
o.number = true
o.relativenumber = true
o.ruler = true

-- Search, case insensitive unless /c or capital in word
o.incsearch = true
o.smartcase = true

-- Turn off errors
o.writebackup = false
o.backup = false
o.errorbells = false
o.swapfile = false

-- At least n lines above and below cursor
o.scrolloff = 8

-- Line length
-- Wrap when line exceed length
o.textwidth = 0
o.columns = 79
o.colorcolumn = '80'
o.wrap = true
o.wrapmargin = 0
o.linebreak = true

-- Shell and split 
o.hidden = true
o.splitbelow = true
-- Setting shell to 'pwsh' will not work
-- It is set to 'cmd' here and 'pwsh' in terminal plugins
o.shell = 'cmd'

-- Colors 
o.termguicolors = true



-- More lines for error messages
o.cmdheight = 2