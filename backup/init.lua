return {
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"ludovicchabant/vim-gutentags",
	"rebelot/kanagawa.nvim",
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
	{
		"sainnhe/everforest",
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.everforest_enable_italic = true
			vim.cmd.colorscheme("everforest")
		end,
	},
	-- UI to select things (files, grep results, open buffers...)
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-lualine/lualine.nvim", -- Fancier statusline
	-- Add indentation guides even on blank lines
	-- 'lukas-reineke/indent-blankline.nvim',
	-- Add git related info in the signs columns and popups
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- Highlight, edit, and navigate code using a fast incremental parsing library
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		build = ":TSUpdate",
	},
	"neovim/nvim-lspconfig", -- Collection of configurations for built-in LSP client
	-- 'davidhalter/jedi-vim', -- Autocompletion for python
	"lervag/vimtex", -- latex plugins
	"KeitaNakamura/tex-conceal.vim",
	--	'SirVer/ultisnips',
	{ "SirVer/ultisnips", dependencies = { "honza/vim-snippets", "rbonvall/snipmate-snippets-bib" } },
	"KeitaNakamura/tex-conceal.vim",
}
