vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

vim.cmd [[highlight IndentBlanklineIndentOff guifg=#C678DD gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextChar guifg=#98C379 gui=bold]]

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
	char_highlight_list = {  },
	show_first_indent_level = false,


}