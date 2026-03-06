require("nvim-tree").setup({
	sort = {
		sorter = "extension",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
})
