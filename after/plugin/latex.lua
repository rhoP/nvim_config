-- latex settings
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_automatic = 1
vim.g.vimtex_view_use_temp_files = 0
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_quickfix_mode = 0 
vim.g.vimtex_view_forward_search_on_start = 1
vim.g.vimtex_view_zathura_check_libsynctex = 1
vim.g.vimtex_include_search_enabled = 1
vim.g.vimtex_text_obj_enabled = 1
vim.g.vimtex_fold_enabled = 0  -- Disable folding if it gets annoying
vim.g.vimtex_syntax_enabled = 1
vim.g.vimtex_quickfix_enabled = 1
vim.g.vimtex_quickfix_ignore_filters = {
	'Overfull',
	'Underfull',
	'Package microtype Warning',
}


-- latex snippets
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.tex_conceal = "abdmg"
vim.g.vimtex_imaps_enabled = 0


    -- Main file detection
vim.g.vimtex_main_files = {
  'thesis.tex',
  'main.tex',
  'Templates/tufte/thesis-tufte.tex',
  'Templates/normal/thesis.tex',
  '**/thesis.tex',
  '**/main.tex'
}

    -- Include search paths for navigation
vim.g.vimtex_include_search_paths = {
  '.',
  '..',
  '../..',
  'Content',
  'Content/Chapters',
  'Templates',
  'Templates/tufte',
  'Templates/normal'
}


