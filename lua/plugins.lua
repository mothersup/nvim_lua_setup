-- Check if packer is installed
local execute = vim.api.nvim_command
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap =
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- vim.cmd [[packadd packer.nvim]]

vim.api.nvim_exec(
	[[
    augroup Packer
        autocmd!
        autocmd BufWritePost plugins.lua PackerCompile
    augroup end
]],
	false
)

return require("packer").startup({
	function(use)
		-- Manage packer itself
		use("wbthomason/packer.nvim")

		-- Plenary and pop_up
		use("nvim-lua/plenary.nvim")
		use("nvim-lua/popup.nvim")

		-- Icons
		-- use 'ryanoasis/vim-devicons'
		use("kyazdani42/nvim-web-devicons")

		-- use 'joshdick/onedark.vim'
		-- use {'sonph/onehalf', rtp = 'vim/'}

		-- Telescope and fzf
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "kdheepak/lazygit.nvim" },
			},
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
		})

		-- LSP, installer
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")
		use("neovim/nvim-lspconfig")

		-- LSP related
		use("jose-elias-alvarez/null-ls.nvim")
		use({
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("kosayoda/nvim-lightbulb")
		-- use("j-hui/fidget.nvim")
		use("ray-x/lsp_signature.nvim")
		use("rmagatti/goto-preview")
		use("onsails/lspkind-nvim")

		-- autocomplete and snippets
		use("hrsh7th/nvim-cmp")
		use("hrsh7th/cmp-nvim-lsp")
		use("hrsh7th/cmp-buffer")
		use("hrsh7th/cmp-path")
		use("hrsh7th/cmp-cmdline")
		use("kdheepak/cmp-latex-symbols")
		use("dcampos/nvim-snippy")
		use("dcampos/cmp-snippy")
		use("lukas-reineke/cmp-under-comparator")

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
		})
		use("nvim-treesitter/nvim-treesitter-refactor")
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("p00f/nvim-ts-rainbow")

		-- Status line
		use({
			"hoob3rt/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
		})

		-- Startup
		use({
			"startup-nvim/startup.nvim",
			requires = {
				"nvim-telescope/telescope.nvim",
				"nvim-lua/plenary.nvim",
			},
		})

		-- Editing
		use("lukas-reineke/indent-blankline.nvim")
		use("windwp/nvim-autopairs")
		use("kylechui/nvim-surround")
		use("yamatsum/nvim-cursorline")
		use("AckslD/nvim-trevJ.lua")
		-- use { 'tpope/vim-surround' }
		--[[
        use {
            'echasnovski/mini.nvim',
            branch = 'stable'
        }
		--]]

		-- File explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = {
				"kyazdani42/nvim-web-devicons", -- optional, for file icon
			},
		})

		-- Buffers (Tab)
		use({
			"akinsho/bufferline.nvim",
			requires = "kyazdani42/nvim-web-devicons",
		})
		use("famiu/bufdelete.nvim")
		use("luukvbaal/stabilize.nvim")

		-- Comments
		use("numToStr/Comment.nvim")
		use({
			"danymat/neogen",
			requires = "nvim-treesitter/nvim-treesitter",
		})

		-- lazygit
		use("kdheepak/lazygit.nvim")

		-- Terminal
		use("numToStr/FTerm.nvim")

		-- Color themes
		use("navarasu/onedark.nvim")
		use({
			"frenzyexists/aquarium-vim",
			branch = "develop",
		})
		use("rebelot/kanagawa.nvim")
		use("muchzill4/doubletrouble")
		use({ "catppuccin/nvim", as = "catppuccin" })

		-- Colors related
		use("rktjmp/lush.nvim")
		use("norcalli/nvim-colorizer.lua")
		use("winston0410/cmd-parser.nvim")
		use("winston0410/range-highlight.nvim")
		--
		-- use("themercorp/themer.lua")
		-- Language specific

		-- Latex
		-- use("lervag/vimtex")
		use("frabjous/knap")
		use({
			"f3fora/nvim-texlabconfig",
			build = "go build",
		})

		-- Markdown
		-- use("davidgranstrom/nvim-markdown-preview")
		use({
			"toppair/peek.nvim",
			run = "deno task --quiet build:fast",
		})
		-- use 'ellisonleao/glow.nvim'

		-- Automatically set up your configuration after cloning packer.nvim
		-- Put this at the end after all plugins
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		display = {
			open_fn = require("packer.util").float,
		},
	},
})
