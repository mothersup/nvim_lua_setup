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
        
        -- Plenary and pop_up
        use 'nvim-lua/plenary.nvim'
        use 'nvim-lua/popup.nvim'
        
        -- Icons
        -- use 'ryanoasis/vim-devicons'
        use 'kyazdani42/nvim-web-devicons'

		-- use 'joshdick/onedark.vim'
        -- use {'sonph/onehalf', rtp = 'vim/'}
		
        -- Telescope and fzf
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
				{ 'nvim-lua/plenary.nvim' },
				{ 'kdheepak/lazygit.nvim' }
			}
        }
        use {
            'nvim-telescope/telescope-fzf-native.nvim', 
            run = 'make'
        }

        -- LSP, installer 
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'

        -- LSP related
		use 'jose-elias-alvarez/null-ls.nvim'
        use {
            'folke/trouble.nvim',
            requires = 'kyazdani42/nvim-web-devicons'
        }
        use 'kosayoda/nvim-lightbulb'
        use 'j-hui/fidget.nvim'
		use 'ray-x/lsp_signature.nvim'
		use 'rmagatti/goto-preview'
		use 'onsails/lspkind-nvim'
		--[[
        use {
            'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
            as = 'lsp_lines.nvim'
        }
		use 'simrat39/symbols-outline.nvim'
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
        -- use 'hrsh7th/cmp-vsnip'
        -- use 'hrsh7th/vim-vsnip'
        use 'dcampos/nvim-snippy'
        use 'dcampos/cmp-snippy'
        use 'lukas-reineke/cmp-under-comparator'
        -- use 'hrsh7th/cmp-nvim-lsp-signature-help'

        -- Treesitter
        use {
            'nvim-treesitter/nvim-treesitter',
            run = ':TSUpdate'
        }
        use 'nvim-treesitter/nvim-treesitter-refactor'
        use 'p00f/nvim-ts-rainbow'

        -- Status line
        use {
            'hoob3rt/lualine.nvim',
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }
		-- use 'famiu/feline.nvim'

        -- Startup
        -- Faster startup speed
        use 'lewis6991/impatient.nvim'
        use {
            'startup-nvim/startup.nvim',
            requires = {
                'nvim-telescope/telescope.nvim', 
                'nvim-lua/plenary.nvim'
            }
        }
        -- use 'henriquehbr/nvim-startup.lua'

		-- Editing
		use 'lukas-reineke/indent-blankline.nvim'
        use 'windwp/nvim-autopairs'
		use 'max397574/better-escape.nvim'
		use 'ur4ltz/surround.nvim'
		use 'yamatsum/nvim-cursorline'
        -- blackCauldron7 is removed, use 'ul4ltz's distribution
        --[[
        use {
            "blackCauldron7/surround.nvim",
            config = function()
            require"surround".setup {mappings_style = "sandwich"}
        end
        }
        --]]
        -- use { 'tpope/vim-surround' }
		--[[
        use { 
            'echasnovski/mini.nvim', 
            branch = 'stable' 
        }
		--]]
        -- use 'McAuleyPenney/tidy.nvim'
		-- use 'folke/zen-mode.nvim'
		
        -- File explorer
        use {
           'kyazdani42/nvim-tree.lua',
            requires = {
               'kyazdani42/nvim-web-devicons', -- optional, for file icon
           },
        }
        
        -- Buffers (Tab)
        use {
            'akinsho/bufferline.nvim', 
            requires = 'kyazdani42/nvim-web-devicons'
        }
        use 'famiu/bufdelete.nvim'
        use 'luukvbaal/stabilize.nvim'
        -- use 'sunjon/shade.nvim'
        -- use 'moll/vim-bbye'
        
        -- Comments
        use 'numToStr/Comment.nvim'
        use {
            'danymat/neogen',
            requires = 'nvim-treesitter/nvim-treesitter'
        }
		
		-- lazygit
		use 'kdheepak/lazygit.nvim'
		
        -- Terminal
        use 'numToStr/FTerm.nvim'
        -- use 'akinsho/toggleterm.nvim'
        
        -- Color themes
        use 'navarasu/onedark.nvim'
        use {
			'frenzyexists/aquarium-vim', 
			branch = 'develop'
		}
		use 'rebelot/kanagawa.nvim'
		use 'muchzill4/doubletrouble'
		use { 'catppuccin/nvim', as = 'catppuccin' }

		-- Colors related
		use 'rktjmp/lush.nvim'
        use 'norcalli/nvim-colorizer.lua'
		use 'winston0410/cmd-parser.nvim'
        use 'winston0410/range-highlight.nvim'
		use 'xiyaowong/nvim-transparent'

        
		use 'themercorp/themer.lua'
        -- Language specific
        
        -- Latex
        use 'lervag/vimtex'
        -- use 'frabjous/knap'
        -- use 'C:/Users/shark/Documents/knap'
        
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
