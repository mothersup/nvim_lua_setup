-- Check if packer is installed
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

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
		use 'themercorp/themer.lua'

        -- LSP, installer 
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
        use 'jose-elias-alvarez/null-ls.nvim'

        
        -- LSP related
        use {
            'folke/trouble.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }
        use 'kosayoda/nvim-lightbulb'
        use 'j-hui/fidget.nvim'
        use {
            'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
            as = 'lsp_lines.nvim'
        }
        use 'ray-x/lsp_signature.nvim'
		use 'rmagatti/goto-preview'
		use 'simrat39/symbols-outline.nvim'
		--[[
        use {
            'ray-x/navigator.lua', 
            requires = {
                'ray-x/guihua.lua', 
                run = 'cd lua/fzy && make'
            }, 
			config = function()
				require('navigator').setup({
					lsp_installer = true,
				})
			end,
        }
		--]]

        
        -- autocomplete and snippets
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-buffer'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-cmdline'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/vim-vsnip'
        use 'lukas-reineke/cmp-under-comparator'
        use 'hrsh7th/cmp-nvim-lsp-signature-help'
        use 'onsails/lspkind-nvim'


        -- Status line
        use 'famiu/feline.nvim'
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
        
        -- Startup
        use 'henriquehbr/nvim-startup.lua'
        use {
            'startup-nvim/startup.nvim',
            requires = {
                'nvim-telescope/telescope.nvim', 
                'nvim-lua/plenary.nvim'
            }
        }

        -- Telescope and fzf
        use {
            'nvim-telescope/telescope.nvim',
            requires = {'nvim-lua/plenary.nvim'}
        }
        use {
            'nvim-telescope/telescope-fzf-native.nvim', 
            run = 'make'
        }

        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'nvim-treesitter/nvim-treesitter-refactor'
        use 'p00f/nvim-ts-rainbow'
		
		-- Show blank lines and spaces
		use 'lukas-reineke/indent-blankline.nvim'


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
        -- use 'moll/vim-bbye'
		use 'famiu/bufdelete.nvim'
		
		-- better jk
		use {
			'max397574/better-escape.nvim',
			config = function()
				require("better_escape").setup()
			end,
		}
	        
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
            'danymat/neogen',
            config = function()
                require('neogen').setup { enabled = true }
            end,
            requires = 'nvim-treesitter/nvim-treesitter'
        }
		
        -- Terminal
        use 'numToStr/FTerm.nvim'
        use 'akinsho/toggleterm.nvim'
        
        -- Color
        use 'norcalli/nvim-colorizer.lua'
        use 'winston0410/cmd-parser.nvim'
        use 'winston0410/range-highlight.nvim'
		use 'rktjmp/lush.nvim'
        
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