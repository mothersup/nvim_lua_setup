local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

plugins = {
	-- Plenary and Popup
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",

	-- Icons
	"kyazdani42/nvim-web-devicons",

	-- Telescope and fzf
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "kdheepak/lazygit.nvim" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},

	-- LSP, installer
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",

	-- LSP related
	"nvimtools/none-ls.nvim",
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"kosayoda/nvim-lightbulb",
	"ray-x/lsp_signature.nvim",
	"rmagatti/goto-preview",
	"onsails/lspkind-nvim",

	-- autocomplete and snippets
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"kdheepak/cmp-latex-symbols",
	"dcampos/nvim-snippy",
	"dcampos/cmp-snippy",
	"lukas-reineke/cmp-under-comparator",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/nvim-treesitter-refactor",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"HiPhish/rainbow-delimiters.nvim",

	-- Status line
	{
		"hoob3rt/lualine.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
	},

	-- Startup
	{
		"startup-nvim/startup.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	-- Editing
	"lukas-reineke/indent-blankline.nvim",
	"windwp/nvim-autopairs",
	"kylechui/nvim-surround",
	"yamatsum/nvim-cursorline",
	"AckslD/nvim-trevJ.lua",

	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			-- optional, for file icon
			"kyazdani42/nvim-web-devicons",
		},
	},

	-- Buffers (Tab)
	{
		"akinsho/bufferline.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
	},
	"famiu/bufdelete.nvim",
	"luukvbaal/stabilize.nvim",

	-- Comments
	"numToStr/Comment.nvim",
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
	},

	-- lazygit
	"kdheepak/lazygit.nvim",

	-- Terminal
	"numToStr/FTerm.nvim",

	-- Color themes
	"navarasu/onedark.nvim",
	{
		"frenzyexists/aquarium-vim",
		branch = "develop",
	},
	"rebelot/kanagawa.nvim",
	"muchzill4/doubletrouble",
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Colors related
	"rktjmp/lush.nvim",
	"norcalli/nvim-colorizer.lua",
	"winston0410/cmd-parser.nvim",
	"winston0410/range-highlight.nvim",

	-- Language specific
	-- Latex
	{
		"f3fora/nvim-texlabconfig",
		build = "go build",
		ft = "tex",
	},
	-- Markdown
	-- "davidgranstrom/nvim-markdown-preview",
	{
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		ft = "md",
	},
}

require("lazy").setup(plugins)
