-- ~/.config/lua/config/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

vim.g.mapleader = " " -- the leader key is used in many keymaps,

local plugins = {
	{ "lewis6991/gitsigns.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	-- Treesitters
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	-- Telescope for fuzzy finding
	{
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	},
	-- File Tree
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("nvim-tree").setup()
			vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
		end,
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
				},
			})
		end,
	},
	-- Harpoon?
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	--lsp configuration
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },

		opts = {},
	},
	---- autocomp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	}, --additional autocompletion
	{ "nvim-neotest/nvim-nio" },
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
		},
	},
	---- folding
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
	},
	---- snippets
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = { "saadparwaiz1/cmp_luasnip", "rafamadriz/friendly-snippets" },
	}, --snippet engine
	{
		"mireq/luasnip-snippets",
		dependencies = { "L3MON4D3/LuaSnip" },
		init = function()
			-- Mandatory setup function
			require("luasnip_snippets.common.snip_utils").setup()
		end,
	},
	-- latex pluginss
	{
		"lervag/vimtex",
		lazy = false, -- lazy-loading will disable inverse search
		config = function()
			vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
			vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
		end,
		keys = {
			{ "<localLeader>l", "", desc = "+vimtex", ft = "tex" },
		},
	},
	{ "KeitaNakamura/tex-conceal.vim" },
	{ "iurimateus/luasnip-latex-snippets.nvim", dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" } },
	{
		"shaunsingh/nord.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("nord")
		end,
	},
	{ "nvim-telescope/telescope-bibtex.nvim", requires = { "nvim-telescope/telescope.nvim" } },
	----------------------------------color schemes--------------------------------------------
	{
		"shaunsingh/nord.nvim",
		name = "nord",
		config = function()
			vim.cmd("colorscheme nord")
		end,
	},
	--------------------------------------------------------------------------------------------
	{ "folke/zen-mode.nvim" },
	{ "evesdropper/luasnip-latex-snippets.nvim" },
	{
		"aidavdw/bibcite.nvim",
		-- Running these commands triggers lazy load. They are still auto-completed.
		cmd = { "CiteOpen", "CiteInsert", "CitePeek", "CiteNote" },
		-- Hitting these keybinds triggers lazy-load. They still show up in which-keys.
		keys = {
			{ "<leader>ci", ":CiteInsert<CR>", desc = "Insert citation" },
			{ "<leader>cp", ":CitePeek<CR>", desc = "Peek citation info" },
			{ "<leader>co", ":CiteOpen<CR>", desc = "Open citation file" },
			{ "<leader>cn", ":CiteNote<CR>", desc = "Open citation note" },
		},
		-- Configuration goes here! See the config section.
		opts = {
			-- This is just an example
			bibtex_path = "~/Documents/Research/bib/references.bib",
			pdf_dir = "~/Documents/Research/papers",
			notes_dir = "~/Documents/Research/notes",
			text_file_open_mode = "vsplit",
		},
	},
}

require("lazy").setup(plugins, {})
