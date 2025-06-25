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

vim.g.mapleader = " "

vim.g.python3_host_prog = "/usr/bin/python3"

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "lazyvim.plugins.extras.lang.python" },
		{ import = "plugins" },
	},
})

-- latex settings
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_enabled = 1

-- latex snippets
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.tex_conceal = "abdmg"

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

--Set colorscheme
vim.o.termguicolors = true
vim.cmd([[colorscheme everforest]])

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

--Set statusbar
require("lualine").setup({
	options = {
		icons_enabled = false,
		theme = "everforest",
		component_separators = "|",
		section_separators = "",
	},
})

-- setlocal spell
-- set spelllang=en_us
-- inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
