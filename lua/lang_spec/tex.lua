vim.opt.conceallevel = 1
vim.g.tex_conceal = 'abdmg'
vim.g.tex_nospell = 1

function _G.replace_display_math()
    vim.cmd [[ :%s/\$\$\(\(.\|\n\)\{-\}\)/\\[\1\\]/g ]]
end
