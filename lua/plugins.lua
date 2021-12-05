-- Check if packer is installed
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- vim.cmd [[packadd packer.nvim]]

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

return require('packer').startup(function()
    -- Manage packer itself
    use 'wbthomason/packer.nvim'

    -- Color themes
    use 'joshdick/onedark.vim'
    use {'sonph/onehalf', rtp = 'vim/'}
    -- Packer rtp does not work, manually append onehalf path
    vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('data') .. '/site/pack/packer/start/onehalf/vim'
    use {'frenzyexists/aquarium-vim', branch = 'develop'}

    -- LSP, autocomplete, snippets
    use {
	'neovim/nvim-lspconfig'
	-- 'williamboman/nvim-lsp-installer'
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- Status line
    use 'famiu/feline.nvim'
    use 'ryanoasis/vim-devicons'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
     }

    -- Telescope and 
    use {
        'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'}
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

    use 'lervag/vimtex'

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
   
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)