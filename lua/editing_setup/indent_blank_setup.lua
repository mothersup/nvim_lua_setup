vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.cmd [[highlight IndentBlanklineIndentOff guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#C678DD gui=bold]]

require('indent_blankline').setup {
	buftype_exclude = {
		'terminal', 
		'nofile', 
		'NvimTree'
	},
	filetype_exclude = {
        'lspinfo',
        'packer',            
        'checkhealth', 
        'help',
		'startup',
        '',
	}, 
	use_treesitter = true, 
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
	char_highlight_list = { 'IndentBlanklineIndentOff' },
	show_first_indent_level = false,
}