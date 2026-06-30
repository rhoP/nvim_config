vim.g.python3_host_prog = "/home/rohit/.venvs/nvimenv/bin/python3"

-- nvim tree options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.clipboard = unnamedplus
-- line numbering
vim.o.number = true
vim.o.relativenumber = true

-- set tab spaces to 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.wrap = true

-- hand off undoing to undotree plugin and don't keep a swapfile
vim.o.swapfile = false
vim.o.backup = false
vim.undodir = os.getenv("HOME") .. "/.vim.undodir"
vim.o.undofile = true

-- set incremental search. This helps immensly with tricky searches
vim.o.hlsearch = false
vim.o.incsearch = true

-- idk what these are tbh
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
--vim.o.isfname:append("@-@")

-- fast update time
vim.o.updatetime = 50

-- color column to 80 characters
--vim.o.colorcolumn = "80"

-- filetype trigger
vim.o.filetype = "on"

-- set escape to enter normal mode in terminal buffer
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { silent = true, noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader><leader>term",
	":belowright split | terminal<CR>",
	{ noremap = true, silent = true }
)

-- keymaps for conform
-- Format with conform
vim.keymap.set({ "n", "v" }, "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format buffer" })

-- For better unicode/glyph support in terminal
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- Set fallback fonts for terminal (if supported)
vim.o.guifont = "JetBrains Nerd"

-- Filetype detection
vim.filetype.add({
	pattern = {
		[".*%.cfg"] = function()
			-- Check if the content looks like EditorConfig
			local content = vim.fn.join(vim.fn.readfile(vim.fn.expand("%"), "", 10), "\n")
			if content:match("^%s*%[.*%]") or content:match("^%s*[^%s=]+%s*=%s*[^%s]") then
				return "editorconfig"
			end
			return "cfg"
		end,
	},
})

-- Folding, options from nvim-ufo
vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Python lsp
-- set to "basedpyright" as another option
vim.g.lazyvim_python_lsp = "pyright"
