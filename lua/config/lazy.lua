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
    	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
   	 {"nvim-telescope/telescope.nvim", tag = '0.1.6', 
        	requires = { {"nvim-lua/plenary.nvim"}}},
    	{"ThePrimeagen/harpoon", branch = "harpoon2",
        	dependencies = {"nvim-lua/plenary.nvim"}},
    	{"mbbill/undotree"},
    	{"tpope/vim-fugitive"}, --lsp configuration
        {"neovim/nvim-lspconfig"}, --lsp configs
        {"hrsh7th/cmp-nvim-lsp"}, -- autocompletion
        {"hrsh7th/nvim-cmp"}, --additional autocompletion
        {"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", 
		dependencies = {'saadparwaiz1/cmp_luasnip','rafamadriz/friendly-snippets'}}, --snippet engine
        {"williamboman/mason.nvim"}, --lsp package manager
	{"nvimtools/none-ls.nvim"},
        {"williamboman/mason-lspconfig.nvim"}, --lsp package manager configs
	"lervag/vimtex", -- latex plugins
	"KeitaNakamura/tex-conceal.vim",
	--	'SirVer/ultisnips',
	{ "SirVer/ultisnips", dependencies = { "honza/vim-snippets", "rbonvall/snipmate-snippets-bib" } },
	"KeitaNakamura/tex-conceal.vim",
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

}

require("lazy").setup(plugins, {})
