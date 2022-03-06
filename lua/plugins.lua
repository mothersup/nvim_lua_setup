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

return require('packer').startup({
	function()
		-- Manage packer itself
		use 'wbthomason/packer.nvim'
		
		-- Faster startup speed
		use 'lewis6991/impatient.nvim'

		-- Plenary and pop_up
		use 'nvim-lua/plenary.nvim'
		use 'nvim-lua/popup.nvim'
		
		-- Icons
		use 'ryanoasis/vim-devicons'
		use 'kyazdani42/nvim-web-devicons'

		-- Color themes
		use 'joshdick/onedark.vim'
		use {'sonph/onehalf', rtp = 'vim/'}
		-- Packer rtp does not work, manually append onehalf path
		vim.o.runtimepath = vim.o.runtimepath .. ',' .. vim.fn.stdpath('data') .. '/site/pack/packer/start/onehalf/vim'
		use {'frenzyexists/aquarium-vim', branch = 'develop'}
		use 'rebelot/kanagawa.nvim'

		-- LSP, installer 
		use 'neovim/nvim-lspconfig'
		use 'williamboman/nvim-lsp-installer'
		use 'jose-elias-alvarez/null-ls.nvim'
		use 'j-hui/fidget.nvim'
		use {
			'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
			as = 'lsp_lines.nvim'
		}
		
		-- autocomplete and snippets
		use 'hrsh7th/nvim-cmp'
		use 'hrsh7th/cmp-nvim-lsp'
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-path'
		use 'hrsh7th/cmp-cmdline'
		use 'hrsh7th/cmp-vsnip'
		use 'hrsh7th/vim-vsnip'
		use 'lukas-reineke/cmp-under-comparator'

		-- Status line
		use 'famiu/feline.nvim'
		use {
			'hoob3rt/lualine.nvim',
			requires = {'kyazdani42/nvim-web-devicons', opt = true}
		}

		-- Telescope and fzf
		use {
			'nvim-telescope/telescope.nvim',
			requires = {'nvim-lua/plenary.nvim'}
		}
		use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}

		-- Treesitter
		use {
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		}
		use  'p00f/nvim-ts-rainbow'

		-- Autopairs
		use 'windwp/nvim-autopairs'

		-- File explorer
		use {
		   'kyazdani42/nvim-tree.lua',
			requires = {
			   'kyazdani42/nvim-web-devicons', -- optional, for file icon
		   },
		   config = function() require('nvim-tree').setup {} end
		}
		
		-- Buffers (Tab)
		use {
			'akinsho/bufferline.nvim', 
			requires = 'kyazdani42/nvim-web-devicons'
		}
		use 'moll/vim-bbye'
		
		-- Remove trailing white spaces
		-- use "McAuleyPenney/tidy.nvim"
		
		-- Surround
		-- blackCauldron7 is removed, use 'ul4ltz's distribution
		--[[
		use {
		    "blackCauldron7/surround.nvim",
		    config = function()
		    require"surround".setup {mappings_style = "sandwich"}
		end
		}
		--]]
		use { 'ur4ltz/surround.nvim' }
		-- use { 'tpope/vim-surround' }
		use { 
			'echasnovski/mini.nvim', 
			branch = 'stable' 
		}
		
		-- Comments
		use {
			'numToStr/Comment.nvim',
			config = function()
				require('Comment').setup()
			end
		}
		use {
			"danymat/neogen",
			config = function()
				require('neogen').setup { enabled = true }
			end,
			requires = "nvim-treesitter/nvim-treesitter"
		}

		-- Terminal
		use 'numToStr/FTerm.nvim'
		use 'akinsho/toggleterm.nvim'
		
		-- Color
		use 'norcalli/nvim-colorizer.lua'
		use 'winston0410/cmd-parser.nvim'
		use 'winston0410/range-highlight.nvim'
		
		-- Language specific
		
		-- Latex
		use 'lervag/vimtex'
		
		-- Markdown 
		use 'davidgranstrom/nvim-markdown-preview'
		-- use 'ellisonleao/glow.nvim'
	   
		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require('packer').sync()
		end
	end, 
	config = {
	    display = {
		    open_fn = require('packer.util').float,
		}
	}
})