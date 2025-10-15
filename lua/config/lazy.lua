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
     	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    	{"nvim-telescope/telescope.nvim", tag = '0.1.6', 
        	requires = { {"nvim-lua/plenary.nvim"}}},
			{'nvim-tree/nvim-tree.lua'},
    	{"ThePrimeagen/harpoon", branch = "harpoon2",
        	dependencies = {"nvim-lua/plenary.nvim"}},
    	{"mbbill/undotree"},
    	{"tpope/vim-fugitive"}, --lsp configuration
		{
			"neovim/nvim-lspconfig",
			optional = true,
			opts = {
			servers = {
			texlab = {
			keys = {
				{ "<Leader>K", "<plug>(vimtex-doc-package)", desc = "Vimtex Docs", silent = true },
						},
					},
				},
			},
		},
		---- autocomp
        {"hrsh7th/cmp-nvim-lsp"}, -- autocompletion
        {"hrsh7th/nvim-cmp"}, --additional autocompletion
		---- snippets
        {"L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", 
		dependencies = {'saadparwaiz1/cmp_luasnip','rafamadriz/friendly-snippets'}}, --snippet engine
	    -- {"nvimtools/none-ls.nvim"},
		-- latex pluginss
		{"nvimtools/none-ls.nvim"},
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
		{"KeitaNakamura/tex-conceal.vim"},
		{"iurimateus/luasnip-latex-snippets.nvim", dependencies = {"L3MON4D3/LuaSnip", "lervag/vimtex"}},
		{
			"shaunsingh/nord.nvim",
			priority=1000,
			config = function()
				vim.cmd.colorscheme("nord")
			end,
		},
 	    {"nvim-telescope/telescope-bibtex.nvim", requires = {"nvim-telescope/telescope.nvim"}},
	    --color schemes
        {"shaunsingh/nord.nvim",
            name = "nord",
	        config = function()
		        vim.cmd("colorscheme nord")
	        end
        },
	    {"folke/zen-mode.nvim"},
	    {"evesdropper/luasnip-latex-snippets.nvim"},
	    {'aidavdw/bibcite.nvim',
          -- Running these commands triggers lazy load. They are still auto-completed.
          cmd = { 'CiteOpen', 'CiteInsert', 'CitePeek', 'CiteNote' },
          -- Hitting these keybinds triggers lazy-load. They still show up in which-keys.
          keys = {
              { '<leader>ci', ':CiteInsert<CR>', desc = 'Insert citation' },
              { '<leader>cp', ':CitePeek<CR>', desc = 'Peek citation info' },
              { '<leader>co', ':CiteOpen<CR>', desc = 'Open citation file' },
              { '<leader>cn', ':CiteNote<CR>', desc = 'Open citation note' },
           },
           -- Configuration goes here! See the config section.
           opts = {
           -- This is just an example
           bibtex_path = '~/Documents/Research/bib/references.bib',
           pdf_dir = '~/Documents/Research/papers',
           notes_dir = '~/Documents/Research/notes',
           text_file_open_mode = 'vsplit',
          } 
        }
   }

require("lazy").setup(plugins, {})
